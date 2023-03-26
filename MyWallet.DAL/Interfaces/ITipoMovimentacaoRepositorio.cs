using ControleFinanceiro.BLL.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Interfaces
{
    public interface ITipoMovimentacaoRepositorio: IRepositorioGenerico<TipoMovimentacao>
    {
        new IQueryable<TipoMovimentacao> ObterTodos();
        new Task<TipoMovimentacao> ObterPeloId(int id);
        IList<TipoMovimentacao> FiltrarTiposMovimentacao(string nomeTipo);
    }
}
