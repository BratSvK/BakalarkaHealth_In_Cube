using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace HealthInCube_BackEnd.Migrations
{
    public partial class Sprievodka : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // migrationBuilder.AlterColumn<decimal>(
            //     name: "UserId",
            //     table: "UserTokens",
            //     type: "DECIMAL(18, 2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18,2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "IdMestoNarodenia",
            //     table: "Users",
            //     type: "DECIMAL(18, 2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18,2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "Id",
            //     table: "Users",
            //     type: "DECIMAL(18, 2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18,2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "UserId",
            //     table: "UserRoles",
            //     type: "DECIMAL(18, 2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18,2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "RoleId",
            //     table: "UserRoles",
            //     type: "DECIMAL(18, 2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18,2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "UserId",
            //     table: "UserLogins",
            //     type: "DECIMAL(18, 2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18,2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "UserId",
            //     table: "UserClaims",
            //     type: "DECIMAL(18, 2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18,2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "Id",
            //     table: "Roles",
            //     type: "DECIMAL(18, 2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18,2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "RoleId",
            //     table: "RoleClaims",
            //     type: "DECIMAL(18, 2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18,2)");

            // migrationBuilder.CreateTable(
            //     name: "SPRIEVODKA",
            //     columns: table => new
            //     {
            //         IdPacient = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         IdLekar = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         TerminOd = table.Column<DateTimeOffset>(type: "DATE", nullable: false),
            //         IdTypVysetrenia = table.Column<int>(type: "NUMBER(10)", nullable: false),
            //         TerminDo = table.Column<DateTimeOffset>(type: "DATE", nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_SPRIEVODKA", x => new { x.IdLekar, x.IdPacient, x.TerminOd });
            //         table.ForeignKey(
            //             name: "FK_SPRIEVODKA_LEKAR_IdLekar",
            //             column: x => x.IdLekar,
            //             principalTable: "LEKAR",
            //             principalColumn: "ID_LEKAR",
            //             onDelete: ReferentialAction.Cascade);
            //         table.ForeignKey(
            //             name: "FK_SPRIEVODKA_PACIENT_IdPacient",
            //             column: x => x.IdPacient,
            //             principalTable: "PACIENT",
            //             principalColumn: "ID_PACIENT",
            //             onDelete: ReferentialAction.Cascade);
            //         table.ForeignKey(
            //             name: "FK_SPRIEVODKA_TYP_LEKARA_IdTypLekarNavigationIdTyp",
            //             column: x => x.IdTypVysetrenia,
            //             principalTable: "TYP_LEKARA",
            //             principalColumn: "ID_TYP",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateIndex(
            //     name: "IX_SPRIEVODKA_IdPacient",
            //     table: "SPRIEVODKA",
            //     column: "IdPacient");

            migrationBuilder.CreateIndex(
                name: "IX_SPRIEVODKA_IdLekar",
                table: "SPRIEVODKA",
                column: "IdLekar");

            migrationBuilder.CreateIndex(
                name: "IX_SPRIEVODKA_IdTypLekarNavigationIdTyp",
                table: "SPRIEVODKA",
                column: "IdTypVysetrenia");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SPRIEVODKA");

            migrationBuilder.AlterColumn<decimal>(
                name: "UserId",
                table: "UserTokens",
                type: "DECIMAL(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "DECIMAL(18, 2)");

            migrationBuilder.AlterColumn<decimal>(
                name: "IdMestoNarodenia",
                table: "Users",
                type: "DECIMAL(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "DECIMAL(18, 2)");

            migrationBuilder.AlterColumn<decimal>(
                name: "Id",
                table: "Users",
                type: "DECIMAL(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "DECIMAL(18, 2)");

            migrationBuilder.AlterColumn<decimal>(
                name: "UserId",
                table: "UserRoles",
                type: "DECIMAL(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "DECIMAL(18, 2)");

            migrationBuilder.AlterColumn<decimal>(
                name: "RoleId",
                table: "UserRoles",
                type: "DECIMAL(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "DECIMAL(18, 2)");

            migrationBuilder.AlterColumn<decimal>(
                name: "UserId",
                table: "UserLogins",
                type: "DECIMAL(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "DECIMAL(18, 2)");

            migrationBuilder.AlterColumn<decimal>(
                name: "UserId",
                table: "UserClaims",
                type: "DECIMAL(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "DECIMAL(18, 2)");

            migrationBuilder.AlterColumn<decimal>(
                name: "Id",
                table: "Roles",
                type: "DECIMAL(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "DECIMAL(18, 2)");

            migrationBuilder.AlterColumn<decimal>(
                name: "RoleId",
                table: "RoleClaims",
                type: "DECIMAL(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "DECIMAL(18, 2)");
        }
    }
}
