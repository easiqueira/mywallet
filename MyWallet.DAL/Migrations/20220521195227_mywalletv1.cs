using Microsoft.EntityFrameworkCore.Migrations;

namespace MyWallet.DAL.Migrations
{
    public partial class mywalletv1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Categorias_Tipos_TipoId",
                table: "Categorias");

            migrationBuilder.DropTable(
                name: "Tipos");

            migrationBuilder.DropIndex(
                name: "IX_Categorias_TipoId",
                table: "Categorias");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "858aff6c-5d1f-437f-9733-21f045826ecc");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "e7444c36-5bf4-4e06-8fe1-ef195ef296e1");

            migrationBuilder.DropColumn(
                name: "TipoId",
                table: "Categorias");

            migrationBuilder.AddColumn<int>(
                name: "TipoMovimentacaoId",
                table: "Categorias",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Reservas",
                columns: table => new
                {
                    ReservaId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Descricao = table.Column<string>(maxLength: 50, nullable: false),
                    CategoriaId = table.Column<int>(nullable: false),
                    Valor = table.Column<double>(nullable: false),
                    Dia = table.Column<int>(nullable: false),
                    MesId = table.Column<int>(nullable: false),
                    Ano = table.Column<int>(nullable: false),
                    UsuarioId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Reservas", x => x.ReservaId);
                    table.ForeignKey(
                        name: "FK_Reservas_Categorias_CategoriaId",
                        column: x => x.CategoriaId,
                        principalTable: "Categorias",
                        principalColumn: "CategoriaId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Reservas_Mes_MesId",
                        column: x => x.MesId,
                        principalTable: "Mes",
                        principalColumn: "MesId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Reservas_Usuarios_UsuarioId",
                        column: x => x.UsuarioId,
                        principalTable: "Usuarios",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "TiposMovimentacao",
                columns: table => new
                {
                    TipoMovimentacaoId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nome = table.Column<string>(maxLength: 20, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TiposMovimentacao", x => x.TipoMovimentacaoId);
                });

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "f7451e11-2ef8-44d4-a38c-755e6e885655", "4eab3356-66f6-40aa-b2c2-90ce489c9ce3", "Administrador do Sistema", "Administrador", "ADMINISTRADOR" });

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "51ad58bb-1fbf-4afb-9899-5fb9907bf269", "2cfdf219-25f5-4248-b49d-d3987eeaaa61", "Usuario do Sistema", "Usuario", "USUARIO" });

            migrationBuilder.CreateIndex(
                name: "IX_Categorias_TipoMovimentacaoId",
                table: "Categorias",
                column: "TipoMovimentacaoId");

            migrationBuilder.CreateIndex(
                name: "IX_Reservas_CategoriaId",
                table: "Reservas",
                column: "CategoriaId");

            migrationBuilder.CreateIndex(
                name: "IX_Reservas_MesId",
                table: "Reservas",
                column: "MesId");

            migrationBuilder.CreateIndex(
                name: "IX_Reservas_UsuarioId",
                table: "Reservas",
                column: "UsuarioId");

            migrationBuilder.AddForeignKey(
                name: "FK_Categorias_TiposMovimentacao_TipoMovimentacaoId",
                table: "Categorias",
                column: "TipoMovimentacaoId",
                principalTable: "TiposMovimentacao",
                principalColumn: "TipoMovimentacaoId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Categorias_TiposMovimentacao_TipoMovimentacaoId",
                table: "Categorias");

            migrationBuilder.DropTable(
                name: "Reservas");

            migrationBuilder.DropTable(
                name: "TiposMovimentacao");

            migrationBuilder.DropIndex(
                name: "IX_Categorias_TipoMovimentacaoId",
                table: "Categorias");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "51ad58bb-1fbf-4afb-9899-5fb9907bf269");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "f7451e11-2ef8-44d4-a38c-755e6e885655");

            migrationBuilder.DropColumn(
                name: "TipoMovimentacaoId",
                table: "Categorias");

            migrationBuilder.AddColumn<int>(
                name: "TipoId",
                table: "Categorias",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Tipos",
                columns: table => new
                {
                    TipoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nome = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tipos", x => x.TipoId);
                });

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "e7444c36-5bf4-4e06-8fe1-ef195ef296e1", "9a5bc06e-7916-4773-8b31-a69d671864db", "Administrador do Sistema", "Administrador", "ADMINISTRADOR" },
                    { "858aff6c-5d1f-437f-9733-21f045826ecc", "07bfd32b-14d2-435f-a65a-230eb6a90008", "Usuario do Sistema", "Usuario", "USUARIO" }
                });

            migrationBuilder.InsertData(
                table: "Tipos",
                columns: new[] { "TipoId", "Nome" },
                values: new object[,]
                {
                    { 1, "Despesa" },
                    { 2, "Ganho" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Categorias_TipoId",
                table: "Categorias",
                column: "TipoId");

            migrationBuilder.AddForeignKey(
                name: "FK_Categorias_Tipos_TipoId",
                table: "Categorias",
                column: "TipoId",
                principalTable: "Tipos",
                principalColumn: "TipoId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
