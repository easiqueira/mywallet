using ControleFinanceiro.BLL.Models;
using Microsoft.EntityFrameworkCore;
using MyWallet.DAL.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Repositorios
{
    public class TipoMovimentacaoRepositorio : RepositorioGenerico<TipoMovimentacao>, ITipoMovimentacaoRepositorio
    {
        private readonly Contexto _contexto;

        public TipoMovimentacaoRepositorio(Contexto contexto) : base(contexto)
        {
            _contexto = contexto;
        }

        public new IQueryable<TipoMovimentacao> ObterTodos()
        {
            try
            {
                return _contexto.TiposMovimentacao.AsQueryable();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public new async Task<TipoMovimentacao> ObterPeloId(int id)
        {
            try
            {
                return await _contexto.TiposMovimentacao.Where(x => x.IdTipoMovimentacao == id).FirstOrDefaultAsync();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IList<TipoMovimentacao> FiltrarTiposMovimentacao(string nomeTipo)
        {
            try
            {
                return _contexto.TiposMovimentacao.Where(c => c.Nome.Contains(nomeTipo)).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
