using Microsoft.EntityFrameworkCore.Migrations;

namespace HealthInCube_BackEnd.Migrations
{
    public partial class AlterTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // migrationBuilder.DropForeignKey(
            //     name: "RELATIONSHIP52",
            //     table: "POUZIVATEL");

            // migrationBuilder.DropTable(
            //     name: "ROLA");

            // migrationBuilder.RenameColumn(
            //     name: "ID_TYP",
            //     table: "POUZIVATEL",
            //     newName: "IdTyp");

            // migrationBuilder.AlterColumn<decimal>(
            //     name: "IdTyp",
            //     table: "POUZIVATEL",
            //     type: "DECIMAL(18, 2)",
            //     nullable: false,
            //     oldClrType: typeof(decimal),
            //     oldType: "NUMBER(38)");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "IdTyp",
                table: "POUZIVATEL",
                newName: "ID_TYP");

            migrationBuilder.AlterColumn<decimal>(
                name: "ID_TYP",
                table: "POUZIVATEL",
                type: "NUMBER(38)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "DECIMAL(18, 2)");

            migrationBuilder.CreateTable(
                name: "ROLA",
                columns: table => new
                {
                    ID_TYP = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
                    NAZOV = table.Column<string>(type: "VARCHAR2(40)", unicode: false, maxLength: 40, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ROLA", x => x.ID_TYP);
                });

            migrationBuilder.AddForeignKey(
                name: "RELATIONSHIP52",
                table: "POUZIVATEL",
                column: "ID_TYP",
                principalTable: "ROLA",
                principalColumn: "ID_TYP",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
