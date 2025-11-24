using EdoSign.Lab_3.Data;
using EdoSign.Lab_3.Models.Dto;
using EdoSign.Lab_3.Models.Orm;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EdoSign.Lab_3.Controllers.Api
{
    [ApiController]
    [Route("api/v{version:apiVersion}/Clients")]
    [ApiVersion("1.0")]
    [ApiVersion("2.0")]
    public class ClientsController : ControllerBase
    {
        private readonly ApplicationDbContext _db;

        public ClientsController(ApplicationDbContext db)
        {
            _db = db;
        }

        // ===================== V1 =====================
        [HttpGet(Name = "Clients_GetV1")]
        [MapToApiVersion("1.0")]
        public async Task<ActionResult<IEnumerable<ClientV1Dto>>> GetV1()
        {
            var clients = await _db.Clients
                .Select(c => new ClientV1Dto
                {
                    Id = c.Id,
                    Name = c.Name
                })
                .ToListAsync();

            return Ok(clients);
        }

        // ===================== V2 =====================
        [HttpGet(Name = "Clients_GetV2")]
        [MapToApiVersion("2.0")]
        public async Task<ActionResult<IEnumerable<ClientV2Dto>>> GetV2()
        {
            var clients = await _db.Clients
                .Select(c => new ClientV2Dto
                {
                    Id = c.Id,
                    Name = c.Name,
                    Email = c.Email
                })
                .ToListAsync();

            return Ok(clients);
        }

        // ===================== GET BY ID =====================
        [HttpGet("{id:int}", Name = "Clients_GetById")]
        public async Task<ActionResult<ClientV2Dto>> GetById(int id)
        {
            var c = await _db.Clients.FindAsync(id);
            if (c == null) return NotFound();

            return Ok(new ClientV2Dto
            {
                Id = c.Id,
                Name = c.Name,
                Email = c.Email
            });
        }

        // ===================== CREATE =====================
        [HttpPost(Name = "Clients_Create")]
        public async Task<ActionResult<ClientV2Dto>> Create(ClientV2Dto dto)
        {
            var client = new Client
            {
                Name = dto.Name,
                Email = dto.Email
            };

            _db.Clients.Add(client);
            await _db.SaveChangesAsync();

            dto.Id = client.Id;

            return CreatedAtAction(nameof(GetById), new { id = client.Id, version = "2.0" }, dto);
        }

        // ===================== UPDATE =====================
        [HttpPut("{id:int}", Name = "Clients_Update")]
        public async Task<IActionResult> Update(int id, ClientV2Dto dto)
        {
            var client = await _db.Clients.FindAsync(id);
            if (client == null) return NotFound();

            client.Name = dto.Name;
            client.Email = dto.Email;

            await _db.SaveChangesAsync();
            return NoContent();
        }

        // ===================== DELETE =====================
        [HttpDelete("{id:int}", Name = "Clients_Delete")]
        public async Task<IActionResult> Delete(int id)
        {
            var client = await _db.Clients.FindAsync(id);
            if (client == null) return NotFound();

            _db.Clients.Remove(client);
            await _db.SaveChangesAsync();

            return NoContent();
        }
    }
}
