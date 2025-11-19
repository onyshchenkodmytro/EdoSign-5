using EdoSign.Lab_3.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EdoSign.Lab_3.Controllers
{
    public class ClientsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ClientsController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.Clients.ToListAsync());
        }

        public async Task<IActionResult> Details(int id)
        {
            var client = await _context.Clients.FirstOrDefaultAsync(c => c.Id == id);
            if (client == null)
                return NotFound();

            return View(client);
        }
    }
}
