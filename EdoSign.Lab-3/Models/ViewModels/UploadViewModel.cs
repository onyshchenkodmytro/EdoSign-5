using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace EdoSign.Lab_3.Models.ViewModels
{
    public class UploadViewModel
    {
        public IFormFile File { get; set; }

        public int ClientId { get; set; }
        public List<SelectListItem> Clients { get; set; }

        public int DocumentTypeId { get; set; }
        public List<SelectListItem> DocumentTypes { get; set; }

        public DateTime UploadedAt { get; set; } = DateTime.Now;
    }
}
