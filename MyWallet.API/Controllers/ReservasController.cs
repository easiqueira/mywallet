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
    public class ReservasController : ControllerBase
    {
        private readonly IReservaRepositorio _reservaRepositorio;
        public ReservasController(IReservaRepositorio reservaRepositorio)
        {
            _reservaRepositorio = reservaRepositorio;
        }


        [HttpGet("ObterReservasPeloUsuarioId/{usuarioId}")]
        public async Task<ActionResult<IEnumerable<Reserva>>> ObterReservasPeloUsuarioId(string usuarioId)
        {
            return await _reservaRepositorio.ObterReservasPeloUsuarioId(usuarioId).ToListAsync();
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<Reserva>> GetReserva(int id)
        {
            Reserva reserva = await _reservaRepositorio.ObterPeloId(id);

            if (reserva == null)
                return NotFound();

            return reserva;
        }


        [HttpPost]
        public async Task<ActionResult<Reserva>> PostReserva(Reserva reserva)
        {
            if (ModelState.IsValid)
            {
                await _reservaRepositorio.Inserir(reserva);

                return Ok(new
                {
                    mensagem = $"Reserva no valor de R$ {reserva.Valor} registrada com sucesso"
                });
            }

            return BadRequest(reserva);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<Reserva>> PutReserva(int id, Reserva reserva)
        {
            if (id != reserva.ReservaId)
                return BadRequest();

            if (ModelState.IsValid)
            {
                await _reservaRepositorio.Atualizar(reserva);

                return Ok(new
                {
                    mensagem = $"Reserva no valor de R$ {reserva.Valor} atualizada com sucesso"
                });
            }

            return BadRequest(reserva);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteReserva(int id)
        {
            Reserva reserva = await _reservaRepositorio.ObterPeloId(id);

            if (reserva == null)
            {
                return NotFound();
            }

            await _reservaRepositorio.Excluir(reserva);

            return Ok(new
            {
                mensagem = $"Reserva no valor de R$ {reserva.Valor} excluída com sucesso"
            });
        }

        [HttpGet("FiltrarReservas/{nomeCategoria}")]
        public IList<Reserva> FiltrarReservas(string nomeCategoria)
        {
            return _reservaRepositorio.FiltrarReservas(nomeCategoria);
        }
    }
}
