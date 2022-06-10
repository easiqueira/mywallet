using Microsoft.EntityFrameworkCore.Migrations;

namespace MyWallet.DAL.Migrations
{
    public partial class alteracaotbmeta : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "3ae5cd17-c3bd-4232-ba92-eb4e69d3fa6d");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "b72688d5-f99a-4004-b21f-30b20525c3d9");

            migrationBuilder.DropColumn(
                name: "Atingida",
                table: "Metas");

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "7f963739-78ab-4588-a6d1-4bc67165c0aa", "d6dad1de-5dba-4b56-bc09-ba8c02ffb7d7", "Administrador do Sistema", "Administrador", "ADMINISTRADOR" });

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "a2099f3b-21af-47d6-a336-d110f210cf48", "601a2a5d-e5b4-4166-9d91-67882323c089", "Usuario do Sistema", "Usuario", "USUARIO" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "7f963739-78ab-4588-a6d1-4bc67165c0aa");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "a2099f3b-21af-47d6-a336-d110f210cf48");

            migrationBuilder.AddColumn<bool>(
                name: "Atingida",
                table: "Metas",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "3ae5cd17-c3bd-4232-ba92-eb4e69d3fa6d", "60a0b98b-9f2d-43ed-b787-f6125a757d0c", "Administrador do Sistema", "Administrador", "ADMINISTRADOR" });

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "b72688d5-f99a-4004-b21f-30b20525c3d9", "ffcb50fc-5500-4329-911e-235041c7775a", "Usuario do Sistema", "Usuario", "USUARIO" });
        }
    }
}
