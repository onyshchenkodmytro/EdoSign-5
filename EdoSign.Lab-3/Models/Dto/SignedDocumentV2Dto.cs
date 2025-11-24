namespace EdoSign.Lab_3.Models.Dto
{
    public class SignedDocumentV2Dto
    {
        public int Id { get; set; }
        public string FileName { get; set; } = null!;

        public string ClientName { get; set; } = null!;
        public string DocumentTypeName { get; set; } = null!;

        public DateTime UploadedAt { get; set; }

        public bool IsSigned { get; set; }
        public DateTime? SignedAt { get; set; }
    }
}
