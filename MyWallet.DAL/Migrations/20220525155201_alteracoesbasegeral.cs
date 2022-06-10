using Microsoft.EntityFrameworkCore.Migrations;

namespace MyWallet.DAL.Migrations
{
    public partial class alteracoesbasegeral : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Categorias_TiposMovimentacao_TipoMovimentacaoId",
                table: "Categorias");

            migrationBuilder.DropForeignKey(
                name: "FK_Metas_TiposMovimentacao_IdTipoMovimentacao",
                table: "Metas");

            migrationBuilder.DropPrimaryKey(
                name: "PK_TiposMovimentacao",
                table: "TiposMovimentacao");

            migrationBuilder.DropIndex(
                name: "IX_Categorias_TipoMovimentacaoId",
                table: "Categorias");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "7f963739-78ab-4588-a6d1-4bc67165c0aa");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "a2099f3b-21af-47d6-a336-d110f210cf48");

            migrationBuilder.DropColumn(
                name: "TipoMovimentacaoId",
                table: "TiposMovimentacao");

            migrationBuilder.DropColumn(
                name: "TipoMovimentacaoId",
                table: "Categorias");

            migrationBuilder.AddColumn<int>(
                name: "IdTipoMovimentacao",
                table: "TiposMovimentacao",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddColumn<int>(
                name: "IdTipoMovimentacao",
                table: "Categorias",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddPrimaryKey(
                name: "PK_TiposMovimentacao",
                table: "TiposMovimentacao",
                column: "IdTipoMovimentacao");

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "65d8a8fe-7282-4410-967c-4e6e9b670976", "f38c4e29-2aef-4aca-bf48-462f34abc037", "Administrador do Sistema", "Administrador", "ADMINISTRADOR" });

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "a7ef168b-c770-4b3f-84ce-40f81089a905", "a0c2dda0-97a1-4fdb-816c-af8cfd391003", "Usuario do Sistema", "Usuario", "USUARIO" });

            migrationBuilder.CreateIndex(
                name: "IX_Categorias_IdTipoMovimentacao",
                table: "Categorias",
                column: "IdTipoMovimentacao");

            migrationBuilder.AddForeignKey(
                name: "FK_Categorias_TiposMovimentacao_IdTipoMovimentacao",
                table: "Categorias",
                column: "IdTipoMovimentacao",
                principalTable: "TiposMovimentacao",
                principalColumn: "IdTipoMovimentacao",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Metas_TiposMovimentacao_IdTipoMovimentacao",
                table: "Metas",
                column: "IdTipoMovimentacao",
                principalTable: "TiposMovimentacao",
                principalColumn: "IdTipoMovimentacao",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Categorias_TiposMovimentacao_IdTipoMovimentacao",
                table: "Categorias");

            migrationBuilder.DropForeignKey(
                name: "FK_Metas_TiposMovimentacao_IdTipoMovimentacao",
                table: "Metas");

            migrationBuilder.DropPrimaryKey(
                name: "PK_TiposMovimentacao",
                table: "TiposMovimentacao");

            migrationBuilder.DropIndex(
                name: "IX_Categorias_IdTipoMovimentacao",
                table: "Categorias");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "65d8a8fe-7282-4410-967c-4e6e9b670976");

            migrationBuilder.DeleteData(
                table: "Funcoes",
                keyColumn: "Id",
                keyValue: "a7ef168b-c770-4b3f-84ce-40f81089a905");

            migrationBuilder.DropColumn(
                name: "IdTipoMovimentacao",
                table: "TiposMovimentacao");

            migrationBuilder.DropColumn(
                name: "IdTipoMovimentacao",
                table: "Categorias");

            migrationBuilder.AddColumn<int>(
                name: "TipoMovimentacaoId",
                table: "TiposMovimentacao",
                type: "int",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddColumn<int>(
                name: "TipoMovimentacaoId",
                table: "Categorias",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddPrimaryKey(
                name: "PK_TiposMovimentacao",
                table: "TiposMovimentacao",
                column: "TipoMovimentacaoId");

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "7f963739-78ab-4588-a6d1-4bc67165c0aa", "d6dad1de-5dba-4b56-bc09-ba8c02ffb7d7", "Administrador do Sistema", "Administrador", "ADMINISTRADOR" });

            migrationBuilder.InsertData(
                table: "Funcoes",
                columns: new[] { "Id", "ConcurrencyStamp", "Descricao", "Name", "NormalizedName" },
                values: new object[] { "a2099f3b-21af-47d6-a336-d110f210cf48", "601a2a5d-e5b4-4166-9d91-67882323c089", "Usuario do Sistema", "Usuario", "USUARIO" });

            migrationBuilder.CreateIndex(
                name: "IX_Categorias_TipoMovimentacaoId",
                table: "Categorias",
                column: "TipoMovimentacaoId");

            migrationBuilder.AddForeignKey(
                name: "FK_Categorias_TiposMovimentacao_TipoMovimentacaoId",
                table: "Categorias",
                column: "TipoMovimentacaoId",
                principalTable: "TiposMovimentacao",
                principalColumn: "TipoMovimentacaoId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Metas_TiposMovimentacao_IdTipoMovimentacao",
                table: "Metas",
                column: "IdTipoMovimentacao",
                principalTable: "TiposMovimentacao",
                principalColumn: "TipoMovimentacaoId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
