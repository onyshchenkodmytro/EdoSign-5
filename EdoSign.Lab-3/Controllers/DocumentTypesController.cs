using EdoSign.Lab_3.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EdoSign.Lab_3.Controllers
{
    public class DocumentTypesController : Controller
    {
        private readonly ApplicationDbContext _context;

        public DocumentTypesController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.DocumentTypes.ToListAsync());
        }

        public async Task<IActionResult> Details(int id)
        {
            var type = await _context.DocumentTypes.FirstOrDefaultAsync(c => c.Id == id);
            if (type == null)
                return NotFound();

            return View(type);
        }
    }
}
