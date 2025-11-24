namespace EdoSign.Lab_3.Models.Orm
{
    public class Client
    {
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string Email { get; set; } = null!;

        public ICollection<SignedDocument> SignedDocuments { get; set; }
            = new List<SignedDocument>();
    }
}


