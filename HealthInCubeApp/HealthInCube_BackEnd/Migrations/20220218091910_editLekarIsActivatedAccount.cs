using Microsoft.EntityFrameworkCore.Migrations;

namespace HealthInCube_BackEnd.Migrations
{
    public partial class editLekarIsActivatedAccount : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
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

            // migrationBuilder.AddColumn<bool>(
            //     name: "IsActivated",
            //     table: "LEKAR",
            //     type: "NUMBER(1)",
            //     nullable: false,
            //     defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsActivated",
                table: "LEKAR");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "IdPacient",
            //     table: "VYSTAVENY_TERMIN",
            //     type: "DECIMAL(18,2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18, 2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "IdLekar",
            //     table: "VYSTAVENY_TERMIN",
            //     type: "DECIMAL(18,2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18, 2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "UserId",
            //     table: "UserTokens",
            //     type: "DECIMAL(18,2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18, 2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "IdMestoNarodenia",
            //     table: "Users",
            //     type: "DECIMAL(18,2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18, 2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "Id",
            //     table: "Users",
            //     type: "DECIMAL(18,2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18, 2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "UserId",
            //     table: "UserRoles",
            //     type: "DECIMAL(18,2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18, 2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "RoleId",
            //     table: "UserRoles",
            //     type: "DECIMAL(18,2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18, 2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "UserId",
            //     table: "UserLogins",
            //     type: "DECIMAL(18,2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18, 2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "UserId",
            //     table: "UserClaims",
            //     type: "DECIMAL(18,2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18, 2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "Id",
            //     table: "Roles",
            //     type: "DECIMAL(18,2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18, 2)");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "RoleId",
            //     table: "RoleClaims",
            //     type: "DECIMAL(18,2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "DECIMAL(18, 2)");
        }
    }
}
