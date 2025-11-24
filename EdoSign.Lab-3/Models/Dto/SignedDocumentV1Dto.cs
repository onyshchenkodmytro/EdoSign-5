namespace EdoSign.Lab_3.Models.Dto
{
    public class SignedDocumentV1Dto
    {
        public int Id { get; set; }
        public string FileName { get; set; } = null!;
        public string ClientName { get; set; } = null!;
        public bool IsSigned { get; set; }
    }
}
