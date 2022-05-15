using ControleFinanceiro.BLL.Models;
using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MyWallet.DAL.Interfaces
{
    public interface IUsuarioRepositorio: IRepositorioGenerico<Usuario>
    {
        Task<int> ObterQuantidadeUsuariosRegistrados();
        Task<IdentityResult> CriarUsuario(Usuario usuario, string senha);
        Task IncluirUsuarioEmFuncao(Usuario usuario, string funcao);
        Task LogarUsuario(Usuario usuario, bool lembrar);
        Task<Usuario> ObterUsuarioPeloEmail(string email);
        Task<IList<string>> ObterFuncoesUsuario(Usuario usuario);
        //Task AtualizarUsuario(Usuario usuario);
    }
}
