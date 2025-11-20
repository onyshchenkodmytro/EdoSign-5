using EdoSign.Lab_3.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EdoSign.Lab_3.Controllers
{
    public class SignedDocumentsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _env;

        public SignedDocumentsController(ApplicationDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        // =================== LIST ===================
        public async Task<IActionResult> Index()
        {
            var docs = await _context.SignedDocuments
                .Include(d => d.Client)
                .Include(d => d.DocumentType)
                .ToListAsync();

            return View(docs);
        }

        // =================== DETAILS ===================
        public async Task<IActionResult> Details(int id)
        {
            var doc = await _context.SignedDocuments
                .Include(d => d.Client)
                .Include(d => d.DocumentType)
                .FirstOrDefaultAsync(d => d.Id == id);

            if (doc == null)
                return NotFound();

            return View(doc);
        }

        // =================== DELETE ===================
        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            // 1. Знаходимо SignedDocument
            var signedDoc = await _context.SignedDocuments.FindAsync(id);
            if (signedDoc == null)
            {
                TempData["Message"] = "Документ не знайдено.";
                return RedirectToAction("Index");
            }

            // 2. Знаходимо FileEntity по імені файлу
            var fileEntity = await _context.Files
                .FirstOrDefaultAsync(f => f.FileName == signedDoc.FileName);

            // 3. Видаляємо фізичний файл
            if (fileEntity != null && System.IO.File.Exists(fileEntity.FilePath))
            {
                System.IO.File.Delete(fileEntity.FilePath);
            }

            // 4. Видаляємо FileEntity (якщо є)
            if (fileEntity != null)
            {
                _context.Files.Remove(fileEntity);
            }

            // 5. Видаляємо SignedDocument
            _context.SignedDocuments.Remove(signedDoc);

            await _context.SaveChangesAsync();

            TempData["Message"] = "Документ успішно видалено.";
            return RedirectToAction("Index");
        }
    }
}

