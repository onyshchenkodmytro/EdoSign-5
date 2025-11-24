using EdoSign.Lab_3.Data;
using EdoSign.Lab_3.Models.Dto;
using EdoSign.Lab_3.Models.Orm;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EdoSign.Lab_3.Controllers.Api
{
    [ApiController]
    [Route("api/v{version:apiVersion}/signed-documents")]
    [ApiVersion("1.0")]
    [ApiVersion("2.0")]
    public class SignedDocumentsController : ControllerBase
    {
        private readonly ApplicationDbContext _db;
        private readonly IWebHostEnvironment _env;

        public SignedDocumentsController(ApplicationDbContext db, IWebHostEnvironment env)
        {
            _db = db;
            _env = env;
        }

        // GET V1
        [HttpGet(Name = "SignedDocs_GetV1")]
        [MapToApiVersion("1.0")]
        public async Task<IEnumerable<SignedDocumentV1Dto>> GetV1()
        {
            return await _db.SignedDocuments
                .Include(d => d.Client)
                .Select(d => new SignedDocumentV1Dto
                {
                    Id = d.Id,
                    FileName = d.FileName,
                    ClientName = d.Client.Name,
                    IsSigned = d.IsSigned
                })
                .ToListAsync();
        }

        // GET V2
        [HttpGet(Name = "SignedDocs_GetV2")]
        [MapToApiVersion("2.0")]
        public async Task<IEnumerable<SignedDocumentV2Dto>> GetV2()
        {
            return await _db.SignedDocuments
                .Include(d => d.Client)
                .Include(d => d.DocumentType)
                .Select(d => new SignedDocumentV2Dto
                {
                    Id = d.Id,
                    FileName = d.FileName,
                    ClientName = d.Client.Name,
                    DocumentTypeName = d.DocumentType.Name,
                    UploadedAt = d.UploadedAt,
                    IsSigned = d.IsSigned,
                    SignedAt = d.SignedAt
                })
                .ToListAsync();
        }

        // GET by id
        [HttpGet("{id:int}", Name = "SignedDocs_GetById")]
        public async Task<ActionResult<SignedDocumentV2Dto>> GetById(int id)
        {
            var d = await _db.SignedDocuments
                .Include(x => x.Client)
                .Include(x => x.DocumentType)
                .FirstOrDefaultAsync(x => x.Id == id);

            if (d == null)
                return NotFound();

            return new SignedDocumentV2Dto
            {
                Id = d.Id,
                FileName = d.FileName,
                ClientName = d.Client.Name,
                DocumentTypeName = d.DocumentType.Name,
                UploadedAt = d.UploadedAt,
                IsSigned = d.IsSigned,
                SignedAt = d.SignedAt
            };
        }

        // DELETE
        [HttpDelete("{id:int}", Name = "SignedDocs_Delete")]
        public async Task<IActionResult> Delete(int id)
        {
            var doc = await _db.SignedDocuments.FindAsync(id);
            if (doc == null)
                return NotFound();

            var fileEntity = await _db.Files
                .FirstOrDefaultAsync(f => f.FileName == doc.FileName);

            if (fileEntity != null && System.IO.File.Exists(fileEntity.FilePath))
                System.IO.File.Delete(fileEntity.FilePath);

            if (fileEntity != null)
                _db.Files.Remove(fileEntity);

            _db.SignedDocuments.Remove(doc);
            await _db.SaveChangesAsync();

            return NoContent();
        }
    }
}
