using ControleFinanceiro.BLL.Models;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Interfaces
{
    public interface ICartaoRepositorio : IRepositorioGenerico<Cartao>
    {
        IQueryable<Cartao> ObterCartoesPeloUsuarioId(string usuarioId);

        IQueryable<Cartao> FiltrarCartoes(string numeroCartao);

        Task<int> ObterQuantidadeCartoesPeloUsuarioId(string usuarioId);
    }
}
