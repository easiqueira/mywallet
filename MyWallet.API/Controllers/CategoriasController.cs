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
    public class CategoriasController : ControllerBase
    {
        private readonly ICategoriaRepositorio _categoriaRepositorio;
        private readonly IDespesaRepositorio _despesaRepositorio;
        private readonly IGanhosRepositorio _ganhosRepositorio;
        private readonly IReservaRepositorio _reservaRepositorio;

        public CategoriasController(ICategoriaRepositorio categoriaRepositorio,
            IDespesaRepositorio despesaRepositorio, 
            IGanhosRepositorio ganhosRepositorio,
            IReservaRepositorio reservaRepositorio)
        {
            _categoriaRepositorio = categoriaRepositorio;
            _despesaRepositorio = despesaRepositorio;
            _ganhosRepositorio = ganhosRepositorio;
            _reservaRepositorio = reservaRepositorio;
        }

        [HttpGet]
        [Authorize(Roles = "Administrador")]
        public async Task<ActionResult<IEnumerable<Categoria>>> GetCategorias()
        {
            return await _categoriaRepositorio.ObterTodos().ToListAsync();
        }

        [HttpGet("{id}")]
        [Authorize(Roles = "Administrador")]
        public async Task<ActionResult<Categoria>> GetCategoria(int id)
        {
            var categoria = await _categoriaRepositorio.ObterPeloId(id);

            if (categoria == null)
            {
                return NotFound();
            }

            return categoria;
        }

        [HttpPost]
        [Authorize(Roles = "Administrador")]
        public async Task<ActionResult<Categoria>> PostCategoria(Categoria categoria)
        {
            if (ModelState.IsValid)
            {
                await _categoriaRepositorio.Inserir(categoria);
                return Ok(new
                {
                    mensagem = $"Categoria { categoria.Nome } inserida com sucesso!"
                });
            }

            return BadRequest(ModelState);
        }


        [HttpPut("{id}")]
        [Authorize(Roles = "Administrador")]
        public async Task<IActionResult> PutCategoria(int id, Categoria categoria)
        {
            if (id != categoria.CategoriaId)
            {
                return BadRequest();
            }

            if (ModelState.IsValid)
            {
                await _categoriaRepositorio.Atualizar(categoria);
                return Ok(new
                {
                    mensagem = $"Categoria { categoria.Nome } atualizada com sucesso!"
                });
            }

            return BadRequest(ModelState);
        }


        [HttpDelete("{id}")]
        [Authorize(Roles = "Administrador")]
        public async Task<ActionResult<Categoria>> DeleteCategoria(int id)
        {
            var categoria = await _categoriaRepositorio.ObterPeloId(id);
            if(categoria == null)
            {
                return NotFound();
            }

            var despesa = _despesaRepositorio.FiltrarDespesas(categoria.Nome);
            var ganho = _ganhosRepositorio.FiltrarGanhos(categoria.Nome);
            var reserva = _reservaRepositorio.FiltrarReservas(categoria.Nome);

            if (despesa != null || ganho !=  null || reserva != null)
            {
                return Ok(
                    new
                    {
                        Mensagem = $"A Categoria { categoria.Nome } não pode ser excluída pois possui dados associados.",
                        Erro = true
                    });
            }

            await _categoriaRepositorio.Excluir(id);

            return Ok(new
            {
                mensagem = $"Categoria { categoria.Nome } excluída com sucesso!"
            });
        }

        [HttpGet("FiltrarCategorias/{nomeCategoria}")]
        [Authorize(Roles = "Administrador")]
        public async Task<ActionResult<IEnumerable<Categoria>>> FiltrarCategorias(string nomeCategoria)
        {
            return await _categoriaRepositorio.FiltrarCategorias(nomeCategoria).ToListAsync();
        }

        [HttpGet("FiltrarCategoriasDespesas")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<Categoria>>> FiltrarCategoriasDespesas()
        {
            return await _categoriaRepositorio.ObterCategoriasPeloTipo("Despesa").ToListAsync();
        }

        [Authorize]
        [HttpGet("FiltrarCategoriasGanhos")]
        public async Task<ActionResult<IEnumerable<Categoria>>> FiltrarCategoriasGanhos()
        {
            return await _categoriaRepositorio.ObterCategoriasPeloTipo("Ganho").ToListAsync();
        }

        [Authorize]
        [HttpGet("FiltrarCategoriasReservas")]
        public async Task<ActionResult<IEnumerable<Categoria>>> FiltrarCategoriasReservas()
        {
            return await _categoriaRepositorio.ObterCategoriasPeloTipo("Reserva").ToListAsync();
        }
    }
}
