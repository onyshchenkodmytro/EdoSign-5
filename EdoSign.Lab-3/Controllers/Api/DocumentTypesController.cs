using EdoSign.Lab_3.Data;
using EdoSign.Lab_3.Models.Orm;
using EdoSign.Lab_3.Models.Dto;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EdoSign.Lab_3.Controllers.Api
{
    [ApiController]
    [Route("api/v{version:apiVersion}/document-types")]
    [ApiVersion("1.0")]
    [ApiVersion("2.0")]
    public class DocumentTypesController : ControllerBase
    {
        private readonly ApplicationDbContext _db;

        public DocumentTypesController(ApplicationDbContext db)
        {
            _db = db;
        }

        // GET V1
        [HttpGet(Name = "DocTypes_GetV1")]
        [MapToApiVersion("1.0")]
        public async Task<IEnumerable<DocumentTypeV1Dto>> GetV1()
        {
            return await _db.DocumentTypes
                .Select(t => new DocumentTypeV1Dto
                {
                    Id = t.Id,
                    Name = t.Name
                })
                .ToListAsync();
        }

        // GET V2
        [HttpGet(Name = "DocTypes_GetV2")]
        [MapToApiVersion("2.0")]
        public async Task<IEnumerable<DocumentTypeV2Dto>> GetV2()
        {
            return await _db.DocumentTypes
                .Select(t => new DocumentTypeV2Dto
                {
                    Id = t.Id,
                    Name = t.Name,
                    Description = t.Description
                })
                .ToListAsync();
        }

        // GET by id
        [HttpGet("{id:int}", Name = "DocTypes_GetById")]
        public async Task<ActionResult<DocumentTypeV2Dto>> GetById(int id)
        {
            var t = await _db.DocumentTypes.FindAsync(id);
            if (t == null)
                return NotFound();

            return new DocumentTypeV2Dto
            {
                Id = t.Id,
                Name = t.Name,
                Description = t.Description
            };
        }

        // CREATE
        [HttpPost(Name = "DocTypes_Create")]
        public async Task<ActionResult<DocumentTypeV2Dto>> Create(DocumentTypeV2Dto dto)
        {
            var type = new DocumentType
            {
                Name = dto.Name,
                Description = dto.Description
            };

            _db.DocumentTypes.Add(type);
            await _db.SaveChangesAsync();

            dto.Id = type.Id;
            return CreatedAtAction(nameof(GetById), new { id = type.Id }, dto);
        }

        // UPDATE
        [HttpPut("{id:int}", Name = "DocTypes_Update")]
        public async Task<IActionResult> Update(int id, DocumentTypeV2Dto dto)
        {
            var t = await _db.DocumentTypes.FindAsync(id);
            if (t == null)
                return NotFound();

            t.Name = dto.Name;
            t.Description = dto.Description;

            await _db.SaveChangesAsync();
            return NoContent();
        }

        // DELETE
        [HttpDelete("{id:int}", Name = "DocTypes_Delete")]
        public async Task<IActionResult> Delete(int id)
        {
            var t = await _db.DocumentTypes.FindAsync(id);
            if (t == null)
                return NotFound();

            _db.DocumentTypes.Remove(t);
            await _db.SaveChangesAsync();
            return NoContent();
        }
    }
}
