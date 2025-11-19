namespace EdoSign.Lab_3.Models.Orm
{
    public class Client
    {
        public int Id { get; set; }                 // Первинний ключ
        public string Name { get; set; } = null!;   // Назва клієнта
        public string Email { get; set; } = null!;  // Email

        // Навігаційна властивість: всі документи клієнта
        public ICollection<SignedDocument> SignedDocuments { get; set; } = new List<SignedDocument>();
    }
}
