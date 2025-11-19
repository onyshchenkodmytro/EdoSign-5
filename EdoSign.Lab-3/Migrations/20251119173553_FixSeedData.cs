using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace EdoSign.Lab_3.Migrations
{
    /// <inheritdoc />
    public partial class FixSeedData : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "SignedDocuments",
                keyColumn: "Id",
                keyValue: 1,
                column: "UploadedAt",
                value: new DateTime(2024, 1, 1, 12, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "SignedDocuments",
                keyColumn: "Id",
                keyValue: 2,
                column: "UploadedAt",
                value: new DateTime(2024, 1, 2, 15, 30, 0, 0, DateTimeKind.Unspecified));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "SignedDocuments",
                keyColumn: "Id",
                keyValue: 1,
                column: "UploadedAt",
                value: new DateTime(2025, 11, 17, 17, 31, 32, 379, DateTimeKind.Utc).AddTicks(5112));

            migrationBuilder.UpdateData(
                table: "SignedDocuments",
                keyColumn: "Id",
                keyValue: 2,
                column: "UploadedAt",
                value: new DateTime(2025, 11, 18, 17, 31, 32, 379, DateTimeKind.Utc).AddTicks(6942));
        }
    }
}
