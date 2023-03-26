using ControleFinanceiro.BLL.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Interfaces
{
    public interface IGanhosRepositorio : IRepositorioGenerico<Ganho>
    {
        IQueryable<Ganho> ObterGanhosPeloUsuarioId(string usuarioId);

        IList<Ganho> FiltrarGanhos(string nomeCategoria);

        Task<double> ObterGanhoTotalPeloUsuarioId(string usuarioId);
    }
}
