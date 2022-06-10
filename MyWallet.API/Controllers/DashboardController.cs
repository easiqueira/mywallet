using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MyWallet.API.ViewModels;
using MyWallet.DAL.Interfaces;
using System;
using System.Threading.Tasks;

namespace MyWallet.API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardController : ControllerBase
    {
        private readonly ICartaoRepositorio _cartaoRepositorio;
        private readonly IGanhosRepositorio _ganhosRepositorio;
        private readonly IDespesaRepositorio _despesaRepositorio;
        private readonly IReservaRepositorio _reservaRepositorio;
        private readonly IMesRepositorio _mesRepositorio;
        private readonly IGraficoRepositorio _graficoRepositorio;

        public DashboardController(ICartaoRepositorio cartaoRepositorio, 
            IReservaRepositorio reservaRepositorio,
            IGanhosRepositorio ganhosRepositorio, 
            IDespesaRepositorio despesaRepositorio, 
            IMesRepositorio mesRepositorio, 
            IGraficoRepositorio graficoRepositorio)
        {
            _cartaoRepositorio = cartaoRepositorio;
            _ganhosRepositorio = ganhosRepositorio;
            _reservaRepositorio = reservaRepositorio;
            _despesaRepositorio = despesaRepositorio;
            _mesRepositorio = mesRepositorio;
            _graficoRepositorio = graficoRepositorio;
        }

        [HttpGet("ObterDadosCardsDashboard/{usuarioId}")]
        public async Task<ActionResult<DadosCardsDashboardViewModel>> ObterDadosCardsDashboard(string usuarioId)
        {
            int qtdCartoes = await _cartaoRepositorio.ObterQuantidadeCartoesPeloUsuarioId(usuarioId);
            double reservaTotal = Math.Round(await _reservaRepositorio.ObterReservaTotalPorUsuarioId(usuarioId), 2);
            double ganhoTotal = Math.Round(await _ganhosRepositorio.ObterGanhoTotalPeloUsuarioId(usuarioId), 2);
            double despesaTotal = Math.Round(await _despesaRepositorio.ObterDespesaTotalPorUsuarioId(usuarioId), 2);
            double saldo = Math.Round(ganhoTotal - despesaTotal, 2);

            DadosCardsDashboardViewModel model = new DadosCardsDashboardViewModel
            {
                QtdCartoes = qtdCartoes,
                GanhoTotal = ganhoTotal,
                DespesaTotal = despesaTotal,
                ReservaTotal = reservaTotal,    
                Saldo = saldo
            };

            return model;
        }

        [HttpGet("ObterDadosAnuaisPeloUsuarioId/{usuarioId}/{ano}")]
        public object ObterDadosAnuaisPeloUsuarioId(string usuarioId, int ano)
        {
            return (new
            {
                ganhos = _graficoRepositorio.ObterGanhosAnuaisPeloUsuarioId(usuarioId, ano),
                despesas = _graficoRepositorio.ObterDespesasAnuaisPeloUsuarioId(usuarioId, ano),
                meses = _mesRepositorio.ObterTodos()
            });
        }
    }
}