using Microsoft.EntityFrameworkCore.Migrations;

namespace HealthInCube_BackEnd.Migrations
{
    public partial class editSprievodkaIdTypVysetrenie : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // migrationBuilder.DropForeignKey(
            //     name: "FK_SPRIEVODKA_TYP_LEKARA_IdTypLekarNavigationIdTyp",
            //     table: "SPRIEVODKA");

            // migrationBuilder.DropIndex(
            //     name: "IX_SPRIEVODKA_IdTypLekarNavigationIdTyp",
            //     table: "SPRIEVODKA");

            // migrationBuilder.DropColumn(
            //     name: "IdTypLekarNavigationIdTyp",
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

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "IdTypVysetrenia",
            //     table: "SPRIEVODKA",
            //     type: "NUMBER(38)",
            //     nullable: false,
            //     oldClrType: typeof(int),
            //     oldType: "NUMBER(10)");

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

            migrationBuilder.CreateIndex(
                name: "IX_SPRIEVODKA_IdTypVysetrenia",
                table: "SPRIEVODKA",
                column: "IdTypVysetrenia");

            migrationBuilder.AddForeignKey(
                name: "FK_SPRIEVODKA_TYP_LEKARA_IdTypVysetrenia",
                table: "SPRIEVODKA",
                column: "IdTypVysetrenia",
                principalTable: "TYP_LEKARA",
                principalColumn: "ID_TYP",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SPRIEVODKA_TYP_LEKARA_IdTypVysetrenia",
                table: "SPRIEVODKA");

            migrationBuilder.DropIndex(
                name: "IX_SPRIEVODKA_IdTypVysetrenia",
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

            migrationBuilder.AlterColumn<int>(
                name: "IdTypVysetrenia",
                table: "SPRIEVODKA",
                type: "NUMBER(10)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "NUMBER(38)");

            migrationBuilder.AddColumn<decimal>(
                name: "IdTypLekarNavigationIdTyp",
                table: "SPRIEVODKA",
                type: "NUMBER(38)",
                nullable: true);

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

            migrationBuilder.CreateIndex(
                name: "IX_SPRIEVODKA_IdTypLekarNavigationIdTyp",
                table: "SPRIEVODKA",
                column: "IdTypLekarNavigationIdTyp");

            migrationBuilder.AddForeignKey(
                name: "FK_SPRIEVODKA_TYP_LEKARA_IdTypLekarNavigationIdTyp",
                table: "SPRIEVODKA",
                column: "IdTypLekarNavigationIdTyp",
                principalTable: "TYP_LEKARA",
                principalColumn: "ID_TYP",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
