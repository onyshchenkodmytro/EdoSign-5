using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace EdoSign.Lab_3.Migrations
{
    /// <inheritdoc />
    public partial class AddSignedStatus : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsSigned",
                table: "SignedDocuments",
                type: "INTEGER",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTime>(
                name: "SignedAt",
                table: "SignedDocuments",
                type: "TEXT",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "SignedDocuments",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "IsSigned", "SignedAt" },
                values: new object[] { false, null });

            migrationBuilder.UpdateData(
                table: "SignedDocuments",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "IsSigned", "SignedAt" },
                values: new object[] { false, null });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsSigned",
                table: "SignedDocuments");

            migrationBuilder.DropColumn(
                name: "SignedAt",
                table: "SignedDocuments");
        }
    }
}
