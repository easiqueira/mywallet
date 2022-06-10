using ControleFinanceiro.BLL.Models;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Interfaces
{
    public interface ITipoMovimentacaoRepositorio: IRepositorioGenerico<TipoMovimentacao>
    {
        new IQueryable<TipoMovimentacao> ObterTodos();
        new Task<TipoMovimentacao> ObterPeloId(int id);
        IQueryable<TipoMovimentacao> FiltrarTiposMovimentacao(string nomeTipo);
    }
}
