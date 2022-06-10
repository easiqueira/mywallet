using ControleFinanceiro.BLL.Models;

namespace MyWallet.BLL.Models
{
    public class Meta
    {
        public int IdMeta { get; set; }
        public string Descricao { get; set; }
        public int IdTipoMovimentacao { get; set; }
        public TipoMovimentacao TipoMovimentacao { get; set; }
        public double Valor { get; set; }
        public string UsuarioId { get; set; }
        public Usuario Usuario { get; set; }
    }
}
