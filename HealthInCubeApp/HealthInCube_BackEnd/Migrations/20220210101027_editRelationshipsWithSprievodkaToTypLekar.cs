using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace HealthInCube_BackEnd.Migrations
{
    public partial class editRelationshipsWithSprievodkaToTypLekar : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // migrationBuilder.DropForeignKey(
            //     name: "FK_SPRIEVODKA_TYP_LEKARA_IdTypLekarNavigationIdTyp",
            //     table: "SPRIEVODKA");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "IdPacient",
            //     table: "VYSTAVENY_TERMIN",
            //     type: "DECIMAL(18, 2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18,2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "IdLekar",
            //     table: "VYSTAVENY_TERMIN",
            //     type: "DECIMAL(18, 2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18,2)");

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

            // migrationBuilder.AlterColumn<DateTime>(
            //     name: "TerminDo",
            //     table: "SPRIEVODKA",
            //     type: "TIMESTAMP(7)",
            //     nullable: false,
            //     oldClrType: typeof(DateTimeOffset),
            //     oldType: "TIMESTAMP(7) WITH TIME ZONE");

            // migrationBuilder.AlterColumn<DateTime>(
            //     name: "TerminOd",
            //     table: "SPRIEVODKA",
            //     type: "TIMESTAMP(7)",
            //     nullable: false,
            //     oldClrType: typeof(DateTimeOffset),
            //     oldType: "TIMESTAMP(7) WITH TIME ZONE");

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

            migrationBuilder.AddForeignKey(
                name: "FK_SPRIEVODKA_TYP_LEKARA_IdTypLekarNavigationIdTyp",
                table: "SPRIEVODKA",
                column: "IdTypVysetrenia",
                principalTable: "TYP_LEKARA",
                principalColumn: "ID_TYP",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SPRIEVODKA_TYP_LEKARA_IdTypLekarNavigationIdTyp",
                table: "SPRIEVODKA");

            migrationBuilder.AlterColumn<decimal>(
                name: "IdPacient",
                table: "VYSTAVENY_TERMIN",
                type: "DECIMAL(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "DECIMAL(18, 2)");

            migrationBuilder.AlterColumn<decimal>(
                name: "IdLekar",
                table: "VYSTAVENY_TERMIN",
                type: "DECIMAL(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "DECIMAL(18, 2)");

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

            migrationBuilder.AlterColumn<DateTimeOffset>(
                name: "TerminDo",
                table: "SPRIEVODKA",
                type: "TIMESTAMP(7) WITH TIME ZONE",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "TIMESTAMP(7)");

            migrationBuilder.AlterColumn<DateTimeOffset>(
                name: "TerminOd",
                table: "SPRIEVODKA",
                type: "TIMESTAMP(7) WITH TIME ZONE",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "TIMESTAMP(7)");

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
                name: "FK_SPRIEVODKA_TYP_LEKARA_IdTypLekarNavigationIdTyp",
                table: "SPRIEVODKA",
                column: "IdTypLekarNavigationIdTyp",
                principalTable: "TYP_LEKARA",
                principalColumn: "ID_TYP",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
