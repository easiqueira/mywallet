using ControleFinanceiro.BLL.Models;
using Microsoft.EntityFrameworkCore;
using MyWallet.DAL.Interfaces;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Repositorios
{
    public class CartaoRepositorio : RepositorioGenerico<Cartao>, ICartaoRepositorio
    {
        private readonly Contexto _contexto;
        public CartaoRepositorio(Contexto contexto) : base(contexto)
        {
            _contexto = contexto;
        }

        public IQueryable<Cartao> FiltrarCartoes(string numeroCartao)
        {
            try
            {
                return _contexto.Cartoes.Where(c => c.Numero.Contains(numeroCartao));
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public IQueryable<Cartao> ObterCartoesPeloUsuarioId(string usuarioId)
        {
            try
            {
                return _contexto.Cartoes.Where(c => c.UsuarioId == usuarioId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<int> ObterQuantidadeCartoesPeloUsuarioId(string usuarioId)
        {
            try
            {
                return await _contexto.Cartoes.CountAsync(c => c.UsuarioId == usuarioId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
