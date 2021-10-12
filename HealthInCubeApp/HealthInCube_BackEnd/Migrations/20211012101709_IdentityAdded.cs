using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace HealthInCube_BackEnd.Migrations
{
    public partial class IdentityAdded : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // migrationBuilder.DropForeignKey(
            //     name: "RELATIONSHIP29",
            //     table: "BYDLISKO");

            // migrationBuilder.DropForeignKey(
            //     name: "RELATIONSHIP55",
            //     table: "FOTKA_POUZIVATEL");

            // migrationBuilder.DropForeignKey(
            //     name: "RELATIONSHIP16",
            //     table: "LEKAR");

            // migrationBuilder.DropForeignKey(
            //     name: "RELATIONSHIP10",
            //     table: "PACIENT");

            // migrationBuilder.DropPrimaryKey(
            //     name: "PK_POUZIVATEL",
            //     table: "POUZIVATEL");

            // migrationBuilder.DropIndex(
            //     name: "IX_RELATIONSHIP52",
            //     table: "POUZIVATEL");

            // migrationBuilder.DropColumn(
            //     name: "ID_POUZIVATEL",
            //     table: "POUZIVATEL");

            // migrationBuilder.DropColumn(
            //     name: "IdTyp",
            //     table: "POUZIVATEL");

            migrationBuilder.RenameTable(
                name: "POUZIVATEL",
                newName: "Users");

            migrationBuilder.RenameColumn(
                name: "REGISTROVANY",
                table: "Users",
                newName: "Registrovany");

            migrationBuilder.RenameColumn(
                name: "PRIEZVISKO",
                table: "Users",
                newName: "Priezvisko");

            migrationBuilder.RenameColumn(
                name: "POHLAVIE",
                table: "Users",
                newName: "Pohlavie");

            migrationBuilder.RenameColumn(
                name: "MOBIL",
                table: "Users",
                newName: "Mobil");

            migrationBuilder.RenameColumn(
                name: "MENO",
                table: "Users",
                newName: "Meno");

            migrationBuilder.RenameColumn(
                name: "EMAIL",
                table: "Users",
                newName: "Email");

            migrationBuilder.RenameColumn(
                name: "ROD_PRIEZVISKO",
                table: "Users",
                newName: "RodPriezvisko");

            migrationBuilder.RenameColumn(
                name: "ROD_CISLO",
                table: "Users",
                newName: "RodCislo");

            migrationBuilder.RenameColumn(
                name: "POSLEDNE_PRIHLASENIE",
                table: "Users",
                newName: "PoslednePrihlasenie");

            migrationBuilder.RenameColumn(
                name: "DAT_NARODENIA",
                table: "Users",
                newName: "DatNarodenia");

            migrationBuilder.AlterColumn<DateTime>(
                name: "Registrovany",
                table: "Users",
                type: "TIMESTAMP(7)",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "DATE");

            // migrationBuilder.AlterColumn<string>(
            //     name: "Priezvisko",
            //     table: "Users",
            //     type: "NVARCHAR2(2000)",
            //     nullable: true,
            //     oldClrType: typeof(string),
            //     oldType: "VARCHAR2(15)",
            //     oldUnicode: false,
            //     oldMaxLength: 15);

            // migrationBuilder.AlterColumn<string>(
            //     name: "Pohlavie",
            //     table: "Users",
            //     type: "NVARCHAR2(2000)",
            //     nullable: true,
            //     oldClrType: typeof(string),
            //     oldType: "CHAR(1)",
            //     oldUnicode: false,
            //     oldFixedLength: true,
            //     oldMaxLength: 1,
            //     oldNullable: true);

            // migrationBuilder.AlterColumn<string>(
            //     name: "Mobil",
            //     table: "Users",
            //     type: "NVARCHAR2(2000)",
            //     nullable: true,
            //     oldClrType: typeof(string),
            //     oldType: "VARCHAR2(12)",
            //     oldUnicode: false,
            //     oldMaxLength: 12,
            //     oldNullable: true);

            // migrationBuilder.AlterColumn<string>(
            //     name: "Meno",
            //     table: "Users",
            //     type: "NVARCHAR2(2000)",
            //     nullable: true,
            //     oldClrType: typeof(string),
            //     oldType: "VARCHAR2(15)",
            //     oldUnicode: false,
            //     oldMaxLength: 15);

            // migrationBuilder.AlterColumn<string>(
            //     name: "Email",
            //     table: "Users",
            //     type: "NVARCHAR2(2000)",
            //     nullable: true,
            //     oldClrType: typeof(string),
            //     oldType: "VARCHAR2(255)",
            //     oldUnicode: false,
            //     oldMaxLength: 255);

            // migrationBuilder.AlterColumn<string>(
            //     name: "RodPriezvisko",
            //     table: "Users",
            //     type: "NVARCHAR2(2000)",
            //     nullable: true,
            //     oldClrType: typeof(string),
            //     oldType: "VARCHAR2(15)",
            //     oldUnicode: false,
            //     oldMaxLength: 15,
            //     oldNullable: true);

            // migrationBuilder.AlterColumn<string>(
            //     name: "RodCislo",
            //     table: "Users",
            //     type: "NVARCHAR2(2000)",
            //     nullable: true,
            //     oldClrType: typeof(string),
            //     oldType: "CHAR(11)",
            //     oldUnicode: false,
            //     oldFixedLength: true,
            //     oldMaxLength: 11,
            //     oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "PoslednePrihlasenie",
                table: "Users",
                type: "TIMESTAMP(7)",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "DATE",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "DatNarodenia",
                table: "Users",
                type: "DATE",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "DATE",
                oldNullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "Id",
                table: "Users",
                type: "NUMBER(38)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<int>(
                name: "AccessFailedCount",
                table: "Users",
                type: "NUMBER(10)",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "ConcurrencyStamp",
                table: "Users",
                type: "NVARCHAR2(2000)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "EmailConfirmed",
                table: "Users",
                type: "NUMBER(1)",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "LockoutEnabled",
                table: "Users",
                type: "NUMBER(1)",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTimeOffset>(
                name: "LockoutEnd",
                table: "Users",
                type: "TIMESTAMP(7) WITH TIME ZONE",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "NormalizedEmail",
                table: "Users",
                type: "NVARCHAR2(2000)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "NormalizedUserName",
                table: "Users",
                type: "NVARCHAR2(2000)",
                nullable: true);

            // migrationBuilder.AddColumn<string>(
            //     name: "PasswordHash",
            //     table: "Users",
            //     type: "NVARCHAR2(2000)",
            //     nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PhoneNumber",
                table: "Users",
                type: "NVARCHAR2(2000)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "PhoneNumberConfirmed",
                table: "Users",
                type: "NUMBER(1)",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "SecurityStamp",
                table: "Users",
                type: "NVARCHAR2(2000)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "TwoFactorEnabled",
                table: "Users",
                type: "NUMBER(1)",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "UserName",
                table: "Users",
                type: "NVARCHAR2(100)",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Users",
                table: "Users",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "RoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "1, 1"),
                    RoleId = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
                    ClaimType = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ClaimValue = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RoleClaims", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Roles",
                columns: table => new
                {
                    Id = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
                    Name = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    NormalizedName = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Roles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "1, 1"),
                    UserId = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
                    ClaimType = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ClaimValue = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserClaims", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UserLogins",
                columns: table => new
                {
                    UserId = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
                    LoginProvider = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ProviderKey = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    ProviderDisplayName = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserLogins", x => x.UserId);
                });

            migrationBuilder.CreateTable(
                name: "UserTokens",
                columns: table => new
                {
                    UserId = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
                    LoginProvider = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Name = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true),
                    Value = table.Column<string>(type: "NVARCHAR2(2000)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserTokens", x => x.UserId);
                });

            migrationBuilder.CreateTable(
                name: "UserRoles",
                columns: table => new
                {
                    UserId = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
                    RoleId = table.Column<decimal>(type: "NUMBER(38)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserRoles", x => new { x.RoleId, x.UserId });
                    table.ForeignKey(
                        name: "FK_UserRoles_Roles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserRoles_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_UserRoles_UserId",
                table: "UserRoles",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "RELATIONSHIP29",
                table: "BYDLISKO",
                column: "ID_POUZIVATEL",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "RELATIONSHIP55",
                table: "FOTKA_POUZIVATEL",
                column: "ID_POUZIVATEL",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "RELATIONSHIP16",
                table: "LEKAR",
                column: "ID_POUZIVATEL",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "RELATIONSHIP10",
                table: "PACIENT",
                column: "ID_POUZIVATEL",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "RELATIONSHIP29",
                table: "BYDLISKO");

            migrationBuilder.DropForeignKey(
                name: "RELATIONSHIP55",
                table: "FOTKA_POUZIVATEL");

            migrationBuilder.DropForeignKey(
                name: "RELATIONSHIP16",
                table: "LEKAR");

            migrationBuilder.DropForeignKey(
                name: "RELATIONSHIP10",
                table: "PACIENT");

            migrationBuilder.DropTable(
                name: "RoleClaims");

            migrationBuilder.DropTable(
                name: "UserClaims");

            migrationBuilder.DropTable(
                name: "UserLogins");

            migrationBuilder.DropTable(
                name: "UserRoles");

            migrationBuilder.DropTable(
                name: "UserTokens");

            migrationBuilder.DropTable(
                name: "Roles");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Users",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "AccessFailedCount",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "ConcurrencyStamp",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "EmailConfirmed",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "LockoutEnabled",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "LockoutEnd",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "NormalizedEmail",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "NormalizedUserName",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "PasswordHash",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "PhoneNumber",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "PhoneNumberConfirmed",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "SecurityStamp",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "TwoFactorEnabled",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "UserName",
                table: "Users");

            migrationBuilder.RenameTable(
                name: "Users",
                newName: "POUZIVATEL");

            migrationBuilder.RenameColumn(
                name: "Registrovany",
                table: "POUZIVATEL",
                newName: "REGISTROVANY");

            migrationBuilder.RenameColumn(
                name: "Priezvisko",
                table: "POUZIVATEL",
                newName: "PRIEZVISKO");

            migrationBuilder.RenameColumn(
                name: "Pohlavie",
                table: "POUZIVATEL",
                newName: "POHLAVIE");

            migrationBuilder.RenameColumn(
                name: "Mobil",
                table: "POUZIVATEL",
                newName: "MOBIL");

            migrationBuilder.RenameColumn(
                name: "Meno",
                table: "POUZIVATEL",
                newName: "MENO");

            migrationBuilder.RenameColumn(
                name: "Email",
                table: "POUZIVATEL",
                newName: "EMAIL");

            migrationBuilder.RenameColumn(
                name: "RodPriezvisko",
                table: "POUZIVATEL",
                newName: "ROD_PRIEZVISKO");

            migrationBuilder.RenameColumn(
                name: "RodCislo",
                table: "POUZIVATEL",
                newName: "ROD_CISLO");

            migrationBuilder.RenameColumn(
                name: "PoslednePrihlasenie",
                table: "POUZIVATEL",
                newName: "POSLEDNE_PRIHLASENIE");

            migrationBuilder.RenameColumn(
                name: "DatNarodenia",
                table: "POUZIVATEL",
                newName: "DAT_NARODENIA");

            migrationBuilder.AlterColumn<DateTime>(
                name: "REGISTROVANY",
                table: "POUZIVATEL",
                type: "DATE",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "TIMESTAMP(7)");

            migrationBuilder.AlterColumn<string>(
                name: "PRIEZVISKO",
                table: "POUZIVATEL",
                type: "VARCHAR2(15)",
                unicode: false,
                maxLength: 15,
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "NVARCHAR2(2000)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "POHLAVIE",
                table: "POUZIVATEL",
                type: "CHAR(1)",
                unicode: false,
                fixedLength: true,
                maxLength: 1,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "NVARCHAR2(2000)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "MOBIL",
                table: "POUZIVATEL",
                type: "VARCHAR2(12)",
                unicode: false,
                maxLength: 12,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "NVARCHAR2(2000)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "MENO",
                table: "POUZIVATEL",
                type: "VARCHAR2(15)",
                unicode: false,
                maxLength: 15,
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "NVARCHAR2(2000)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "EMAIL",
                table: "POUZIVATEL",
                type: "VARCHAR2(255)",
                unicode: false,
                maxLength: 255,
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "NVARCHAR2(2000)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "ROD_PRIEZVISKO",
                table: "POUZIVATEL",
                type: "VARCHAR2(15)",
                unicode: false,
                maxLength: 15,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "NVARCHAR2(2000)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "ROD_CISLO",
                table: "POUZIVATEL",
                type: "CHAR(11)",
                unicode: false,
                fixedLength: true,
                maxLength: 11,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "NVARCHAR2(2000)",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "POSLEDNE_PRIHLASENIE",
                table: "POUZIVATEL",
                type: "DATE",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "TIMESTAMP(7)",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "DAT_NARODENIA",
                table: "POUZIVATEL",
                type: "DATE",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "TIMESTAMP(7)",
                oldNullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "ID_POUZIVATEL",
                table: "POUZIVATEL",
                type: "NUMBER(38)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<decimal>(
                name: "IdTyp",
                table: "POUZIVATEL",
                type: "DECIMAL(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddPrimaryKey(
                name: "PK_POUZIVATEL",
                table: "POUZIVATEL",
                column: "ID_POUZIVATEL");

            migrationBuilder.CreateIndex(
                name: "IX_RELATIONSHIP52",
                table: "POUZIVATEL",
                column: "IdTyp");

            migrationBuilder.AddForeignKey(
                name: "RELATIONSHIP29",
                table: "BYDLISKO",
                column: "ID_POUZIVATEL",
                principalTable: "POUZIVATEL",
                principalColumn: "ID_POUZIVATEL",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "RELATIONSHIP55",
                table: "FOTKA_POUZIVATEL",
                column: "ID_POUZIVATEL",
                principalTable: "POUZIVATEL",
                principalColumn: "ID_POUZIVATEL",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "RELATIONSHIP16",
                table: "LEKAR",
                column: "ID_POUZIVATEL",
                principalTable: "POUZIVATEL",
                principalColumn: "ID_POUZIVATEL",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "RELATIONSHIP10",
                table: "PACIENT",
                column: "ID_POUZIVATEL",
                principalTable: "POUZIVATEL",
                principalColumn: "ID_POUZIVATEL",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
