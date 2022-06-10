using Microsoft.EntityFrameworkCore.Migrations;

namespace MyWallet.DAL.Migrations
{
    public partial class alteracoes : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "0b090610-cfef-48fe-b038-36516ce7e03b");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "a86db153-e521-4c9b-afbb-6ca4beb25cf1");

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "3ae5cd17-c3bd-4232-ba92-eb4e69d3fa6d", "60a0b98b-9f2d-43ed-b787-f6125a757d0c", "Administrador do Sistema", "Administrador", "ADMINISTRADOR" });

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "b72688d5-f99a-4004-b21f-30b20525c3d9", "ffcb50fc-5500-4329-911e-235041c7775a", "Usuario do Sistema", "Usuario", "USUARIO" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "3ae5cd17-c3bd-4232-ba92-eb4e69d3fa6d");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "b72688d5-f99a-4004-b21f-30b20525c3d9");

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "a86db153-e521-4c9b-afbb-6ca4beb25cf1", "d94a9902-abb0-4570-9f61-364a7375cef4", "Administrador do Sistema", "Administrador", "ADMINISTRADOR" });

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "0b090610-cfef-48fe-b038-36516ce7e03b", "6916686d-3e5d-4694-b285-a88ecdc2b426", "Usuario do Sistema", "Usuario", "USUARIO" });
        }
    }
}
