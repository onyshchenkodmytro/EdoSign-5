using EdoSign.Lab_3.Models;
using EdoSign.Lab_3.Models.Entities;
using EdoSign.Lab_3.Models.Orm;   
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace EdoSign.Lab_3.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options) { }

        // таблиці:
        public DbSet<Client> Clients { get; set; }
        public DbSet<DocumentType> DocumentTypes { get; set; }
        public DbSet<SignedDocument> SignedDocuments { get; set; }

        public DbSet<FileEntity> Files { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // ---- Seed дані ----

            modelBuilder.Entity<Client>().HasData(
                new Client { Id = 1, Name = "ТОВ \"Альфа\"", Email = "alpha@example.com" },
                new Client { Id = 2, Name = "ПП \"Бета\"", Email = "beta@example.com" }
            );

            modelBuilder.Entity<DocumentType>().HasData(
                new DocumentType { Id = 1, Name = "Договір", Description = "Цивільно-правові договори" },
                new DocumentType { Id = 2, Name = "Акт", Description = "Акти виконаних робіт" }
            );

            modelBuilder.Entity<SignedDocument>().HasData(
    new SignedDocument
    {
        Id = 1,
        FileName = "dogovir_001.pdf",
        UploadedAt = new DateTime(2024, 01, 01, 12, 00, 00),
        ClientId = 1,
        DocumentTypeId = 1
    },
    new SignedDocument
    {
        Id = 2,
        FileName = "akt_001.pdf",
        UploadedAt = new DateTime(2024, 01, 02, 15, 30, 00),
        ClientId = 2,
        DocumentTypeId = 2
    }
);
        }
    }
}

