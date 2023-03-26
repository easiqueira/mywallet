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
        public class CartoesController : ControllerBase
        {
            private readonly ICartaoRepositorio _cartaoRepositorio;
            private readonly IDespesaRepositorio _despesaRepositorio;

            public CartoesController(ICartaoRepositorio cartaoRepositorio,
            IDespesaRepositorio despesaRepositorio)
            {
                _cartaoRepositorio = cartaoRepositorio;
                _despesaRepositorio = despesaRepositorio;
            }

        [HttpGet("ObterCartoesPeloUsuarioId/{usuarioId}")]
        public async Task<IEnumerable<Cartao>> ObterCartoesPeloUsuarioId(string usuarioId)
        {
            return await _cartaoRepositorio.ObterCartoesPeloUsuarioId(usuarioId).ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Cartao>> GetCartao(int id)
        {
            Cartao cartao = await _cartaoRepositorio.ObterPeloId(id);

            if (cartao == null)
                return NotFound();

            return cartao;
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> PutCartao(int id, Cartao cartao)
        {
            if (id != cartao.CartaoId)
            {
                return BadRequest("Cartões diferentes. Não foi possível atualizar");
            }

            if (ModelState.IsValid)
            {
                await _cartaoRepositorio.Atualizar(cartao);

                return Ok(new
                {
                    mensagem = $"Cartão número {cartao.Numero} atualizado com sucesso"
                });
            }

            return BadRequest(cartao);
        }

        [HttpPost]
        public async Task<ActionResult> PostCartao(Cartao cartao)
        {
            if (ModelState.IsValid)
            {
                await _cartaoRepositorio.Inserir(cartao);


                return Ok(new
                {
                    mensagem = $"Cartão número {cartao.Numero} criado com sucesso"
                });
            }

            return BadRequest(cartao);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteCartao(int id)
        {
            Cartao cartao = await _cartaoRepositorio.ObterPeloId(id);

            if (cartao == null)
                return NotFound();

            IList<Despesa> despesas = await _despesaRepositorio.ObterDespesasPeloCartaoId(cartao.CartaoId);

            if (despesas.Count > 0)
            {
                return Ok(
                    new
                    {
                        Mensagem = $"O Cartão { cartao.Nome } não pode ser excluído pois possui dados de despesas associados.",
                        Erro = true
                    });
            }

             await _cartaoRepositorio.Excluir(cartao);


            return Ok(new
            {
                mensagem = $"Cartão número {cartao.Numero} excluído com sucesso"
            });
        }

        [HttpGet("FiltrarCartoes/{numeroCartao}")]
        public async Task<IEnumerable<Cartao>> FiltrarCartoes(string numeroCartao)
        {
            return await _cartaoRepositorio.FiltrarCartoes(numeroCartao).ToListAsync();
        }
    }
    }

