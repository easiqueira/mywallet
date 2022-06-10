using ControleFinanceiro.BLL.Models;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Interfaces
{
    public interface IGanhosRepositorio : IRepositorioGenerico<Ganho>
    {
        IQueryable<Ganho> ObterGanhosPeloUsuarioId(string usuarioId);

        IQueryable<Ganho> FiltrarGanhos(string nomeCategoria);

        Task<double> ObterGanhoTotalPeloUsuarioId(string usuarioId);
    }
}
