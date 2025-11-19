namespace EdoSign.Lab_3.Models.Orm
{
    public class DocumentType
    {
        public int Id { get; set; }                     // Первинний ключ
        public string Name { get; set; } = null!;       // Назва типу (Договір, Акт ...)
        public string? Description { get; set; }        // Опис

        public ICollection<SignedDocument> SignedDocuments { get; set; } = new List<SignedDocument>();
    }
}
