using ControleFinanceiro.BLL.Models;
using MyWallet.DAL.Interfaces;
using System;
using System.Linq;

namespace MyWallet.DAL.Repositorios
{
    public class MesRepositorio : RepositorioGenerico<Mes>, IMesRepositorio
    {
        private readonly Contexto _contexto;
        public MesRepositorio(Contexto contexto) : base(contexto)
        {
            _contexto = contexto;
        }

        public new IQueryable<Mes> ObterTodos()
        {
            try
            {
                return _contexto.Meses.OrderBy(m => m.MesId);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
