using ControleFinanceiro.BLL.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyWallet.DAL.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MyWallet.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class TiposMovimentacaoController : ControllerBase
    {
        private readonly ITipoMovimentacaoRepositorio _tipoRepositorio;
        private readonly ICategoriaRepositorio _categoriaRepositorio;

        public TiposMovimentacaoController(ITipoMovimentacaoRepositorio tipoRepositorio, ICategoriaRepositorio categoriaRepositorio)
        {
            _tipoRepositorio = tipoRepositorio;
            _categoriaRepositorio = categoriaRepositorio;
        }

        [HttpGet]
        [Authorize(Roles = "Administrador")]
        public async Task<ActionResult<IEnumerable<TipoMovimentacao>>> GetTiposMovimentacao()
        {
            return await _tipoRepositorio.ObterTodos().ToListAsync();
        }

        [HttpGet("{id}")]
        [Authorize(Roles = "Administrador")]
        public async Task<ActionResult<TipoMovimentacao>> GetTipoMovimentacao(int id)
        {
            var tipoMovimentacao = await _tipoRepositorio.ObterPeloId(id);

            if (tipoMovimentacao == null)
            {
                return NotFound();
            }

            return tipoMovimentacao;
        }

        [HttpPost]
        [Authorize(Roles = "Administrador")]
        public async Task<ActionResult<TipoMovimentacao>> PostTipoMovimentacao(TipoMovimentacao tipoMovimentacao)
        {
            if (ModelState.IsValid)
            {
                await _tipoRepositorio.Inserir(tipoMovimentacao);
                return Ok(new
                {
                    mensagem = $"Tipo de Movimentação { tipoMovimentacao.Nome } inserido com sucesso!"
                });
            }

            return BadRequest(ModelState);
        }


        [HttpPut("{id}")]
        [Authorize(Roles = "Administrador")]
        public async Task<IActionResult> PutTipoMovimentacao(int id, TipoMovimentacao tipoMovimentacao)
        {
            if (id != tipoMovimentacao.IdTipoMovimentacao)
            {
                return BadRequest();
            }

            if (ModelState.IsValid)
            {
                await _tipoRepositorio.Atualizar(tipoMovimentacao);
                return Ok(new
                {
                    mensagem = $"Tipo de Movimentação { tipoMovimentacao.Nome } atualizado com sucesso!"
                });
            }

            return BadRequest(ModelState);
        }


        [HttpDelete("{id}")]
        [Authorize(Roles = "Administrador")]
        public async Task<ActionResult<TipoMovimentacao>> DeleteTipoMovimentacao(int id)
        {
            var tipoMovimentacao = await _tipoRepositorio.ObterPeloId(id);
            if (tipoMovimentacao == null)
            {
                return NotFound();
            }

            var categoria = _categoriaRepositorio.ObterCategoriasPeloTipo(tipoMovimentacao.Nome);
            if (categoria != null)
            {
                return Ok(
                    new
                    {
                        Mensagem = $"O Tipo de Movimentação { tipoMovimentacao.Nome } não pode ser excluído pois possui dados associados.",
                        Erro = true
                    });
            }

            await _tipoRepositorio.Excluir(id);

            return Ok(new
            {
                mensagem = $"Tipo de Movimentacao { tipoMovimentacao.Nome } excluído com sucesso!"
            });
        }

        [HttpGet("FiltrarTiposMovimentacao/{nomeTipo}")]
        [Authorize(Roles = "Administrador")]
        public async Task<ActionResult<IEnumerable<TipoMovimentacao>>> FiltrarTiposMovimentacao(string nomeTipo)
        {
            return await _tipoRepositorio.FiltrarTiposMovimentacao(nomeTipo).ToListAsync();
        }

    }
}
