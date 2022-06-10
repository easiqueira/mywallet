namespace MyWallet.DAL.Interfaces
{
    public interface IGraficoRepositorio
    {
        object ObterGanhosAnuaisPeloUsuarioId(string usuarioId, int ano);

        object ObterDespesasAnuaisPeloUsuarioId(string usuarioId, int ano);
    }
}
