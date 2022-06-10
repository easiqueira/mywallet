using ControleFinanceiro.BLL.Models;
using Microsoft.EntityFrameworkCore;
using MyWallet.DAL.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Repositorios
{
    public class DespesaRepositorio : RepositorioGenerico<Despesa>, IDespesaRepositorio
    {
        private readonly Contexto _contexto;
        public DespesaRepositorio(Contexto contexto) : base(contexto)
        {
            _contexto = contexto;
        }

        public void ExcluirDespesas(IEnumerable<Despesa> despesas)
        {
            try
            {
                _contexto.Despesas.RemoveRange(despesas);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public IQueryable<Despesa> FiltrarDespesas(string nomeCategoria)
        {
            try
            {
                return _contexto.Despesas
                    .Include(d => d.Cartao).Include(d => d.Mes)
                    .Include(d => d.Categoria).ThenInclude(d => d.TipoMovimentacao)
                    .Where(d => d.Categoria.Nome.Contains(nomeCategoria) && d.Categoria.TipoMovimentacao.Nome == "Despesa");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<IEnumerable<Despesa>> ObterDespesasPeloCartaoId(int cartaoId)
        {
            try
            {
                return await _contexto.Despesas.Where(d => d.CartaoId == cartaoId).ToListAsync();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public IQueryable<Despesa> ObterDespesasPeloUsuarioId(string usuarioId)
        {
            try
            {
                return _contexto.Despesas.Include(d => d.Cartao).Include(c => c.Categoria).Include(c => c.Mes).Where(d => d.UsuarioId == usuarioId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<double> ObterDespesaTotalPorUsuarioId(string usuarioId)
        {
            try
            {
                return await _contexto.Despesas.Where(d => d.UsuarioId == usuarioId).SumAsync(d => d.Valor);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
