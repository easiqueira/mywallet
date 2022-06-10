using Microsoft.EntityFrameworkCore.Migrations;

namespace MyWallet.DAL.Migrations
{
    public partial class novasentidades : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "51ad58bb-1fbf-4afb-9899-5fb9907bf269");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "f7451e11-2ef8-44d4-a38c-755e6e885655");

            migrationBuilder.CreateTable(
                name: "Metas",
                columns: table => new
                {
                    IdMeta = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Descricao = table.Column<string>(maxLength: 50, nullable: false),
                    IdTipoMovimentacao = table.Column<int>(nullable: false),
                    Valor = table.Column<double>(nullable: false),
                    Atingida = table.Column<bool>(nullable: false),
                    UsuarioId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Metas", x => x.IdMeta);
                    table.ForeignKey(
                        name: "FK_Metas_TiposMovimentacao_IdTipoMovimentacao",
                        column: x => x.IdTipoMovimentacao,
                        principalTable: "TiposMovimentacao",
                        principalColumn: "TipoMovimentacaoId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Metas_Usuarios_UsuarioId",
                        column: x => x.UsuarioId,
                        principalTable: "Usuarios",
                        principalColumn: "Id");
                });

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "a86db153-e521-4c9b-afbb-6ca4beb25cf1", "d94a9902-abb0-4570-9f61-364a7375cef4", "Administrador do Sistema", "Administrador", "ADMINISTRADOR" });

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "0b090610-cfef-48fe-b038-36516ce7e03b", "6916686d-3e5d-4694-b285-a88ecdc2b426", "Usuario do Sistema", "Usuario", "USUARIO" });

            migrationBuilder.CreateIndex(
                name: "IX_Metas_IdTipoMovimentacao",
                table: "Metas",
                column: "IdTipoMovimentacao");

            migrationBuilder.CreateIndex(
                name: "IX_Metas_UsuarioId",
                table: "Metas",
                column: "UsuarioId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Metas");

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
                values: new object[] { "f7451e11-2ef8-44d4-a38c-755e6e885655", "4eab3356-66f6-40aa-b2c2-90ce489c9ce3", "Administrador do Sistema", "Administrador", "ADMINISTRADOR" });

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "51ad58bb-1fbf-4afb-9899-5fb9907bf269", "2cfdf219-25f5-4248-b49d-d3987eeaaa61", "Usuario do Sistema", "Usuario", "USUARIO" });
        }
    }
}
