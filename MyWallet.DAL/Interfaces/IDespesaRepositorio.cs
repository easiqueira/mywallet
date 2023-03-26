using ControleFinanceiro.BLL.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Interfaces
{
    public interface IDespesaRepositorio : IRepositorioGenerico<Despesa>
    {
        IQueryable<Despesa> ObterDespesasPeloUsuarioId(string usuarioId);

        void ExcluirDespesas(IEnumerable<Despesa> despesas);

        Task<IList<Despesa>> ObterDespesasPeloCartaoId(int cartaoId);

        IList<Despesa> FiltrarDespesas(string nomeCategoria);

        Task<double> ObterDespesaTotalPorUsuarioId(string usuarioId);
    }
}
