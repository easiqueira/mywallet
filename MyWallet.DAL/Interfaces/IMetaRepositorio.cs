using MyWallet.BLL.Models;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Interfaces
{
    public interface IMetaRepositorio: IRepositorioGenerico<Meta>
    {
        new IQueryable<Meta> ObterTodos();
        new Task<Meta> ObterPeloId(int id);
        IQueryable<Meta> FiltrarMetas(string nomeMeta);
        IQueryable<Meta> ObterMetasPeloTipoMovimentacao(string tipo);
        IQueryable<Meta> ObterMetasPeloUsuarioId(string usuarioId);
    }
}
