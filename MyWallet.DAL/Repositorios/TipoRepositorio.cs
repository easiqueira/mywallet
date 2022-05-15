using ControleFinanceiro.BLL.Models;
using MyWallet.DAL.Interfaces;

namespace MyWallet.DAL.Repositorios
{
    public class TipoRepositorio : RepositorioGenerico<Tipo>, ITipoRepositorio
    {
        public TipoRepositorio(Contexto contexto) : base(contexto)
        {
        }
    }
}
