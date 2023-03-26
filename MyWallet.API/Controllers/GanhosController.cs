using ControleFinanceiro.BLL.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyWallet.DAL.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MyWallet.API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class GanhosController : ControllerBase
    {
        private readonly IGanhosRepositorio _ganhosRepositorio;

        public GanhosController(IGanhosRepositorio ganhosRepositorio)
        {
            _ganhosRepositorio = ganhosRepositorio;
        }

        [HttpGet("ObterGanhosPeloUsuarioId/{usuarioId}")]
        public async Task<ActionResult<IEnumerable<Ganho>>> ObterGanhosPeloUsuarioId(string usuarioId)
        {
            return await _ganhosRepositorio.ObterGanhosPeloUsuarioId(usuarioId).ToListAsync();
        }

        [HttpGet("{ganhoId}")]
        public async Task<ActionResult<Ganho>> GetGanho(int ganhoId)
        {
            Ganho ganho = await _ganhosRepositorio.ObterPeloId(ganhoId);

            if (ganho == null)
                return NotFound();

            return ganho;
        }

        [HttpPut("{ganhoId}")]
        public async Task<ActionResult> PutGanho(int ganhoId, Ganho ganho)
        {
            if (ganhoId != ganho.GanhoId)
                return NotFound();

            if (ModelState.IsValid)
            {
                await _ganhosRepositorio.Atualizar(ganho);

                return Ok(new
                {
                    mensagem = $"Ganho no valor de R$ {ganho.Valor} atualizado com sucesso"
                });
            }

            return BadRequest(ganho);
        }

        [HttpPost]
        public async Task<ActionResult<Ganho>> PostGanho(Ganho ganho)
        {
            if (ModelState.IsValid)
            {
                await _ganhosRepositorio.Inserir(ganho);

                return Ok(new
                {
                    mensagem = $"Ganho no valor de R$ {ganho.Valor} inserido com sucesso"
                });
            }

            return BadRequest(ganho);
        }

        [HttpDelete("{ganhoId}")]
        public async Task<ActionResult> DeleteGanho(int ganhoId)
        {
            Ganho ganho = await _ganhosRepositorio.ObterPeloId(ganhoId);

            if (ganho == null)
                return NotFound();

            await _ganhosRepositorio.Excluir(ganho);

            return Ok(new
            {
                mensagem = $"Ganho no valor de R$ {ganho.Valor} excluído com sucesso"
            });
        }

        [HttpGet("FiltrarGanhos/{nomeCategoria}")]
        public IList<Ganho> FiltrarGanhos(string nomeCategoria)
        {
            return _ganhosRepositorio.FiltrarGanhos(nomeCategoria);
        }
    }
}
