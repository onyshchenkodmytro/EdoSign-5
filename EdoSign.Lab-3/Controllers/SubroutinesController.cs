using EdoSign.Lab_3.Data;
using EdoSign.Lab_3.Models.Entities;
using EdoSign.Lab_3.Models.Orm;
using EdoSign.Lab_3.Models.ViewModels;
using EdoSign.Lab_3.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace EdoSign.Lab_3.Controllers;

[Authorize]
public class SubroutinesController : Controller
{
    private readonly ApplicationDbContext _db;
    private readonly CryptoService _crypto;
    private readonly IWebHostEnvironment _env;

    public SubroutinesController(ApplicationDbContext db, CryptoService crypto, IWebHostEnvironment env)
    {
        _db = db;
        _crypto = crypto;
        _env = env;
    }

    // ============================
    // 1. Завантаження файлу
    // ============================
    [HttpGet]
    public async Task<IActionResult> Upload()
    {
        var model = new UploadViewModel
        {
            Clients = await _db.Clients
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name })
                .ToListAsync(),

            DocumentTypes = await _db.DocumentTypes
                .Select(d => new SelectListItem { Value = d.Id.ToString(), Text = d.Name })
                .ToListAsync()
        };

        return View(model);
    }

    [HttpPost]
    public async Task<IActionResult> Upload(UploadViewModel model)
    {
        if (!ModelState.IsValid)
            return await Upload();

        if (model.File == null || model.File.Length == 0)
        {
            ViewBag.Message = "Файл не вибрано!";
            return await Upload();
        }

        var folder = Path.Combine(_env.WebRootPath, "storage");
        Directory.CreateDirectory(folder);

        var id = Guid.NewGuid();
        var savedName = id + Path.GetExtension(model.File.FileName);
        var path = Path.Combine(folder, savedName);

        using (var stream = new FileStream(path, FileMode.Create))
            await model.File.CopyToAsync(stream);

        var entity = new FileEntity
        {
            Id = id,
            FileName = model.File.FileName,
            FilePath = path
        };

        _db.Files.Add(entity);

        var doc = new SignedDocument
        {
            FileName = model.File.FileName,
            UploadedAt = model.UploadedAt,
            ClientId = model.ClientId,
            DocumentTypeId = model.DocumentTypeId,
            IsSigned = false,
            SignedAt = null
        };

        _db.SignedDocuments.Add(doc);
        await _db.SaveChangesAsync();

        ViewBag.FileId = id;
        ViewBag.Message = "Файл завантажено успішно!";
        return await Upload();
    }

    // ============================
    // 2. Підпис файлу
    // ============================
    [HttpGet]
    public IActionResult SignFile() => View();

    [HttpPost]
    public async Task<IActionResult> SignFile(Guid fileId)
    {
        var file = await _db.Files.FindAsync(fileId);
        if (file == null)
        {
            ViewBag.Message = "Файл не знайдено.";
            return View();
        }

        var bytes = await System.IO.File.ReadAllBytesAsync(file.FilePath);
        var keys = _crypto.GenerateRsaKeyPair();
        var signature = _crypto.SignToBase64(bytes, keys.privatePem);

        file.SignatureBase64 = signature;
        file.PublicKeyPem = keys.publicPem;

        var doc = await _db.SignedDocuments
            .FirstOrDefaultAsync(d => d.FileName == file.FileName);

        if (doc != null)
        {
            doc.IsSigned = true;
            doc.SignedAt = DateTime.UtcNow;
        }

        await _db.SaveChangesAsync();

        ViewBag.Message = "✅ Файл успішно підписано.";
        ViewBag.Signature = signature;
        ViewBag.PublicKey = keys.publicPem;

        return View();
    }

    // ============================
    // 3. Перевірка підпису
    // ============================
    [HttpGet]
    public IActionResult VerifyFile() => View();

    [HttpPost]
    public async Task<IActionResult> VerifyFile(Guid fileId)
    {
        var file = await _db.Files.FindAsync(fileId);
        if (file == null)
        {
            ViewBag.Message = "Файл не знайдено.";
            return View();
        }

        if (file.SignatureBase64 == null || file.PublicKeyPem == null)
        {
            ViewBag.Message = "Файл ще не підписано!";
            return View();
        }

        var bytes = await System.IO.File.ReadAllBytesAsync(file.FilePath);
        bool isValid = _crypto.VerifySignature(bytes, file.SignatureBase64, file.PublicKeyPem);

        ViewBag.Message = isValid ? "✅ Підпис дійсний." : "❌ Підпис недійсний.";
        return View();
    }

    // ============================
    // 4. Масова валідація (long operation)
    // ============================
    [HttpGet("api/mass-validate")]
    public async Task<IActionResult> MassValidate()
    {
        var docs = await _db.SignedDocuments.ToListAsync();

        await _crypto.ValidateManySignaturesAsync(docs);

        return Ok("Mass validation completed");
    }
}

