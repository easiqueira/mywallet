using ControleFinanceiro.BLL.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ControleFinanceiro.DAL.Mapeamentos
{
    public class TipoMovimentacaoMap : IEntityTypeConfiguration<TipoMovimentacao>
    {
        public void Configure(EntityTypeBuilder<TipoMovimentacao> builder)
        {
            builder.HasKey(t => t.IdTipoMovimentacao);
            builder.Property(t => t.Nome).IsRequired().HasMaxLength(20);
            builder.HasMany(t => t.Categorias).WithOne(t => t.TipoMovimentacao);
            builder.HasMany(t => t.Metas).WithOne(t => t.TipoMovimentacao);

            builder.ToTable("TiposMovimentacao");
        }
    }
}
