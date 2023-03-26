using ControleFinanceiro.BLL.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Interfaces
{
    public interface ICategoriaRepositorio: IRepositorioGenerico<Categoria>
    {
        new IQueryable<Categoria> ObterTodos();
        new Task<Categoria> ObterPeloId(int id);
        IQueryable<Categoria> FiltrarCategorias(string nomeCategoria);
        IList<Categoria> ObterCategoriasPeloTipo(string tipo);
    }
}
