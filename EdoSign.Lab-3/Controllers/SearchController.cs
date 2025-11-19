using EdoSign.Lab_3.Data;
using EdoSign.Lab_3.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace EdoSign.Lab_3.Controllers
{
    public class SearchController : Controller
    {
        private readonly ApplicationDbContext _context;

        public SearchController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var model = new DocumentSearchViewModel
            {
                Clients = await _context.Clients
                    .Select(c => new SelectListItem
                    {
                        Value = c.Id.ToString(),
                        Text = c.Name
                    })
                    .ToListAsync()
            };

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Index(DocumentSearchViewModel model)
        {
            var query = _context.SignedDocuments
                .Include(d => d.Client)
                .Include(d => d.DocumentType)
                .AsQueryable();

            if (model.DateFrom.HasValue)
                query = query.Where(d => d.UploadedAt >= model.DateFrom.Value);

            if (model.DateTo.HasValue)
                query = query.Where(d => d.UploadedAt <= model.DateTo.Value);

            if (model.SelectedClientIds != null && model.SelectedClientIds.Any())
                query = query.Where(d => model.SelectedClientIds.Contains(d.ClientId));

            if (!string.IsNullOrWhiteSpace(model.FileNameStartsWith))
                query = query.Where(d => d.FileName.StartsWith(model.FileNameStartsWith));

            if (!string.IsNullOrWhiteSpace(model.FileNameEndsWith))
                query = query.Where(d => d.FileName.EndsWith(model.FileNameEndsWith));

            model.Results = await query.ToListAsync();

            model.Clients = await _context.Clients
                .Select(c => new SelectListItem
                {
                    Value = c.Id.ToString(),
                    Text = c.Name
                })
                .ToListAsync();

            return View(model);
        }
    }
}
