using ControleFinanceiro.BLL.Models;
using Microsoft.EntityFrameworkCore;
using MyWallet.DAL.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Repositorios
{
    public class ReservaRepositorio : RepositorioGenerico<Reserva>, IReservaRepositorio
    {
        private readonly Contexto _contexto;
        public ReservaRepositorio(Contexto contexto) : base(contexto)
        {
            _contexto = contexto;
        }

        public void ExcluirReservas(IEnumerable<Reserva> reservas)
        {
            try
            {
                _contexto.Reservas.RemoveRange(reservas);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public IQueryable<Reserva> FiltrarReservas(string nomeCategoria)
        {
            try
            {
                return _contexto.Reservas
                    .Include(d => d.Categoria).ThenInclude(d => d.TipoMovimentacao)
                    .Where(d => d.Categoria.Nome.Contains(nomeCategoria) && d.Categoria.TipoMovimentacao.Nome == "Reserva");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<IEnumerable<Reserva>> ObterReservasPelaCategoriaId(int categoriaId)
        {
            try
            {
                return await _contexto.Reservas.Where(d => d.CategoriaId == categoriaId).ToListAsync();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public IQueryable<Reserva> ObterReservasPeloUsuarioId(string usuarioId)
        {
            try
            {
                return _contexto.Reservas.Include(c => c.Categoria).Include(c => c.Mes).Where(d => d.UsuarioId == usuarioId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<double> ObterReservaTotalPorUsuarioId(string usuarioId)
        {
            try
            {
                return await _contexto.Reservas.Where(d => d.UsuarioId == usuarioId).SumAsync(d => d.Valor);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
