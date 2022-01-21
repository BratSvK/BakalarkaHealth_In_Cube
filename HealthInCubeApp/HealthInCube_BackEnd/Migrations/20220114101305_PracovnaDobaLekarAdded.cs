using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace HealthInCube_BackEnd.Migrations
{
    public partial class PracovnaDobaLekarAdded : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // migrationBuilder.DropForeignKey(
            //     name: "RELATIONSHIP42",
            //     table: "ZDRAVOTNA_KARTA");

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
            //     name: "ZOZNAM_DEN",
            //     columns: table => new
            //     {
            //         ID_DEN = table.Column<int>(type: "NUMBER(10)", nullable: false)
            //             .Annotation("Oracle:Identity", "1, 1"),
            //         NAZOV = table.Column<string>(type: "NVARCHAR2(10)", nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_ZOZNAM_DEN", x => x.ID_DEN);
            //     });

            // migrationBuilder.CreateIndex(
            //     name: "IX_ZOZNAM_DEN_IdDen",
            //     table: "ZOZNAM_DEN",
            //     column: "ID_DEN");

            migrationBuilder.CreateTable(
                name: "PRAC_DOBA",
                columns: table => new
                {
                    IdLekar = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
                    IdDen = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    PracDobaOd = table.Column<TimeSpan>(type: "INTERVAL DAY(8) TO SECOND(7)", nullable: false),
                    PracDobaDo = table.Column<TimeSpan>(type: "INTERVAL DAY(8) TO SECOND(7)", nullable: false),
                    ObedOd = table.Column<TimeSpan>(type: "INTERVAL DAY(8) TO SECOND(7)", nullable: false),
                    ObedDo = table.Column<TimeSpan>(type: "INTERVAL DAY(8) TO SECOND(7)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PRAC_DOBA", x => new { x.IdLekar, x.IdDen });
                    table.ForeignKey(
                        name: "FK_PRAC_DOBA_LEKAR_IdLekar",
                        column: x => x.IdLekar,
                        principalTable: "LEKAR",
                        principalColumn: "ID_LEKAR",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PRAC_DOBA_ZOZNAM_DEN_IdDen",
                        column: x => x.IdDen,
                        principalTable: "ZOZNAM_DEN",
                        principalColumn: "ID_DEN",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PRAC_DOBA_IdDen",
                table: "PRAC_DOBA",
                column: "IdDen");
                
            migrationBuilder.CreateIndex(
                name: "IX_PRAC_DOBA_IdLekar",
                table: "PRAC_DOBA",
                column: "IdLekar");

            migrationBuilder.AddForeignKey(
                name: "RELATIONSHIP42",
                table: "ZDRAVOTNA_KARTA",
                column: "ID_PACIENT",
                principalTable: "PACIENT",
                principalColumn: "ID_PACIENT",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "RELATIONSHIP42",
                table: "ZDRAVOTNA_KARTA");

            migrationBuilder.DropTable(
                name: "PRAC_DOBA");

            migrationBuilder.DropTable(
                name: "ZOZNAM_DEN");

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

            migrationBuilder.AddForeignKey(
                name: "RELATIONSHIP42",
                table: "ZDRAVOTNA_KARTA",
                column: "ID_PACIENT",
                principalTable: "PACIENT",
                principalColumn: "ID_PACIENT",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
