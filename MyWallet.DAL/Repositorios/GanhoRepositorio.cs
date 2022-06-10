using ControleFinanceiro.BLL.Models;
using Microsoft.EntityFrameworkCore;
using MyWallet.DAL.Interfaces;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Repositorios
{
    public class GanhoRepositorio : RepositorioGenerico<Ganho>, IGanhosRepositorio
    {
        private readonly Contexto _contexto;
        public GanhoRepositorio(Contexto contexto) : base(contexto)
        {
            _contexto = contexto;
        }

        public IQueryable<Ganho> FiltrarGanhos(string nomeCategoria)
        {
            try
            {
                return _contexto.Ganhos
                    .Include(g => g.Mes).Include(g => g.Categoria)
                    .ThenInclude(g => g.TipoMovimentacao)
                    .Where(g => g.Categoria.Nome.Contains(nomeCategoria) && g.Categoria.TipoMovimentacao.Nome.Contains("Ganho"));
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public IQueryable<Ganho> ObterGanhosPeloUsuarioId(string usuarioId)
        {
            try
            {
                return _contexto.Ganhos.Include(g => g.Mes).Include(g => g.Categoria).Where(g => g.UsuarioId == usuarioId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<double> ObterGanhoTotalPeloUsuarioId(string usuarioId)
        {
            try
            {
                return await _contexto.Ganhos.Where(g => g.UsuarioId == usuarioId).SumAsync(g => g.Valor);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
