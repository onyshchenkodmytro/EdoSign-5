using EdoSign.Lab_3.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EdoSign.Lab_3.Controllers
{
    public class SignedDocumentsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public SignedDocumentsController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var docs = await _context.SignedDocuments
                .Include(d => d.Client)
                .Include(d => d.DocumentType)
                .ToListAsync();

            return View(docs);
        }

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
    }
}
