using MyWallet.BLL.Models;
using System.Collections.Generic;

namespace ControleFinanceiro.BLL.Models
{
    public class TipoMovimentacao
    {
        public int IdTipoMovimentacao { get; set; }
        public string Nome { get; set; }
        public virtual ICollection<Categoria> Categorias { get; set; }
        public virtual ICollection<Meta> Metas { get; set; }
    }
}
