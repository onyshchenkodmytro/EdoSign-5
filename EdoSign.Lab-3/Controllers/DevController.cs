using EdoSign.Lab_3.Data;
using EdoSign.Lab_3.Models.Orm;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EdoSign.Lab_3.Controllers;

[ApiController]
[Route("api/dev")]
public class DevController : ControllerBase
{
    private readonly ApplicationDbContext _db;

    public DevController(ApplicationDbContext db)
    {
        _db = db;
    }

    // POST api/dev/seed-big
    [HttpPost("seed-big")]
    public async Task<IActionResult> SeedBig()
    {
        var existing = await _db.SignedDocuments.CountAsync();
        if (existing >= 10_000)
            return Ok($"Вже є {existing} записів, повторний сид не потрібен.");

        var docs = new List<SignedDocument>();
        var now = DateTime.UtcNow;

        for (int i = 0; i < 10_000; i++)
        {
            docs.Add(new SignedDocument
            {
                FileName = $"doc_{existing + i + 1}.pdf",
                UploadedAt = now.AddMinutes(-i),
                ClientId = 1,          
                DocumentTypeId = 1,     
                IsSigned = i % 2 == 0,
                SignedAt = (i % 2 == 0) ? now.AddMinutes(-i) : null
            });
        }

        _db.SignedDocuments.AddRange(docs);
        await _db.SaveChangesAsync();

        return Ok($"Додано {docs.Count} документів, всього тепер {existing + docs.Count}.");
    }
}
