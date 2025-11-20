namespace EdoSign.Lab_3.Models.Orm
{
    public class SignedDocument
    {
        public int Id { get; set; }                         // Первинний ключ
        public string FileName { get; set; } = null!;       // Назва файлу
        public DateTime UploadedAt { get; set; }            // Дата/час завантаження

        public int ClientId { get; set; }                   // Зовнішній ключ до Client
        public Client Client { get; set; } = null!;         // Навігація

        public int DocumentTypeId { get; set; }             // Зовнішній ключ до DocumentType
        public DocumentType DocumentType { get; set; } = null!; // Навігація

        public bool IsSigned { get; set; }
        public DateTime? SignedAt { get; set; }

    }
}

