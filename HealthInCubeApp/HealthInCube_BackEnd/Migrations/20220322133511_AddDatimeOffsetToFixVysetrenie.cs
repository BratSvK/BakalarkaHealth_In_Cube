using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace HealthInCube_BackEnd.Migrations
{
    public partial class AddDatimeOffsetToFixVysetrenie : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // migrationBuilder.DropForeignKey(
            //     name: "FK_VYK_VYSETRENIA_TYP_LEKARA_IdTypVysetrenia",
            //     table: "VYK_VYSETRENIA");

            migrationBuilder.RenameColumn(
                name: "IdTypVysetrenia",
                table: "VYK_VYSETRENIA",
                newName: "ID_TYP");

            migrationBuilder.RenameIndex(
                name: "IX_VYK_VYSETRENIA_IdTypVysetrenia",
                table: "VYK_VYSETRENIA",
                newName: "IX_RELATIONSHIP_IdTypVysetrenie");

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

            migrationBuilder.AlterColumn<DateTimeOffset>(
                name: "DATUM_VYS",
                table: "VYK_VYSETRENIA",
                type: "TIMESTAMP WITH TIME ZONE",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "DATE");

            migrationBuilder.AlterColumn<decimal>(
                name: "ID_TYP",
                table: "VYK_VYSETRENIA",
                type: "NUMBER(38)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "Number(38)");

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

            migrationBuilder.AddForeignKey(
                name: "FK_VYK_VYSETRENIA_TYP_LEKARA_ID_TYP",
                table: "VYK_VYSETRENIA",
                column: "ID_TYP",
                principalTable: "TYP_LEKARA",
                principalColumn: "ID_TYP",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_VYK_VYSETRENIA_TYP_LEKARA_ID_TYP",
                table: "VYK_VYSETRENIA");

            migrationBuilder.RenameColumn(
                name: "ID_TYP",
                table: "VYK_VYSETRENIA",
                newName: "IdTypVysetrenia");

            migrationBuilder.RenameIndex(
                name: "IX_RELATIONSHIP_IdTypVysetrenie",
                table: "VYK_VYSETRENIA",
                newName: "IX_VYK_VYSETRENIA_IdTypVysetrenia");

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

            migrationBuilder.AlterColumn<DateTime>(
                name: "DATUM_VYS",
                table: "VYK_VYSETRENIA",
                type: "DATE",
                nullable: false,
                oldClrType: typeof(DateTimeOffset),
                oldType: "TIMESTAMP WITH TIME ZONE");

            migrationBuilder.AlterColumn<decimal>(
                name: "IdTypVysetrenia",
                table: "VYK_VYSETRENIA",
                type: "Number(38)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "NUMBER(38)");

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
                name: "FK_VYK_VYSETRENIA_TYP_LEKARA_IdTypVysetrenia",
                table: "VYK_VYSETRENIA",
                column: "IdTypVysetrenia",
                principalTable: "TYP_LEKARA",
                principalColumn: "ID_TYP",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
