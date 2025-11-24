namespace EdoSign.Lab_3.Models.Dto
{
    public class DocumentTypeV2Dto
    {
        public int Id { get; set; }
        public string Name { get; set; } = null!;

        // НОВЕ У V2
        public string Description { get; set; } = "";
    }
}
