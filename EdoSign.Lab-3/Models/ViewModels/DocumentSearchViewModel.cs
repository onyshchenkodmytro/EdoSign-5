using EdoSign.Lab_3.Models.Orm;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace EdoSign.Lab_3.Models.ViewModels
{
    public class DocumentSearchViewModel
    {
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }

        public List<int>? SelectedClientIds { get; set; }
        public List<SelectListItem> Clients { get; set; } = new();

        public string? FileNameStartsWith { get; set; }
        public string? FileNameEndsWith { get; set; }

        public List<SignedDocument>? Results { get; set; }
    }
}
