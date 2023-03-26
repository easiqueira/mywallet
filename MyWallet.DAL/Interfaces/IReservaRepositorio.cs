using ControleFinanceiro.BLL.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Interfaces
{
    public interface IReservaRepositorio : IRepositorioGenerico<Reserva>
    {
        IQueryable<Reserva> ObterReservasPeloUsuarioId(string usuarioId);

        void ExcluirReservas(IEnumerable<Reserva> reservas);

        Task<IEnumerable<Reserva>> ObterReservasPelaCategoriaId(int categoriaId);

        IList<Reserva> FiltrarReservas(string nomeCategoria);

        Task<double> ObterReservaTotalPorUsuarioId(string usuarioId);
    }
}
