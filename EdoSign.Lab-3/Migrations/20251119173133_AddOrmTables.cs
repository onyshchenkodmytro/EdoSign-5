using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace EdoSign.Lab_3.Migrations
{
    /// <inheritdoc />
    public partial class AddOrmTables : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Clients",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", nullable: false),
                    Email = table.Column<string>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Clients", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "DocumentTypes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", nullable: false),
                    Description = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DocumentTypes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SignedDocuments",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    FileName = table.Column<string>(type: "TEXT", nullable: false),
                    UploadedAt = table.Column<DateTime>(type: "TEXT", nullable: false),
                    ClientId = table.Column<int>(type: "INTEGER", nullable: false),
                    DocumentTypeId = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SignedDocuments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SignedDocuments_Clients_ClientId",
                        column: x => x.ClientId,
                        principalTable: "Clients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SignedDocuments_DocumentTypes_DocumentTypeId",
                        column: x => x.DocumentTypeId,
                        principalTable: "DocumentTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Clients",
                columns: new[] { "Id", "Email", "Name" },
                values: new object[,]
                {
                    { 1, "alpha@example.com", "ТОВ \"Альфа\"" },
                    { 2, "beta@example.com", "ПП \"Бета\"" }
                });

            migrationBuilder.InsertData(
                table: "DocumentTypes",
                columns: new[] { "Id", "Description", "Name" },
                values: new object[,]
                {
                    { 1, "Цивільно-правові договори", "Договір" },
                    { 2, "Акти виконаних робіт", "Акт" }
                });

            migrationBuilder.InsertData(
                table: "SignedDocuments",
                columns: new[] { "Id", "ClientId", "DocumentTypeId", "FileName", "UploadedAt" },
                values: new object[,]
                {
                    { 1, 1, 1, "dogovir_001.pdf", new DateTime(2025, 11, 17, 17, 31, 32, 379, DateTimeKind.Utc).AddTicks(5112) },
                    { 2, 2, 2, "akt_001.pdf", new DateTime(2025, 11, 18, 17, 31, 32, 379, DateTimeKind.Utc).AddTicks(6942) }
                });

            migrationBuilder.CreateIndex(
                name: "IX_SignedDocuments_ClientId",
                table: "SignedDocuments",
                column: "ClientId");

            migrationBuilder.CreateIndex(
                name: "IX_SignedDocuments_DocumentTypeId",
                table: "SignedDocuments",
                column: "DocumentTypeId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SignedDocuments");

            migrationBuilder.DropTable(
                name: "Clients");

            migrationBuilder.DropTable(
                name: "DocumentTypes");
        }
    }
}
