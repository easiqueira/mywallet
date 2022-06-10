using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MyWallet.BLL.Models;

namespace ControleFinanceiro.DAL.Mapeamentos
{
    public class MetaMap : IEntityTypeConfiguration<Meta>
    {
        public void Configure(EntityTypeBuilder<Meta> builder)
        {
            builder.HasKey(c => c.IdMeta);
            builder.Property(c => c.Descricao).IsRequired().HasMaxLength(50);
            builder.Property(c => c.Valor).IsRequired();

            builder.HasOne(c => c.TipoMovimentacao).WithMany(c => c.Metas).HasForeignKey(c => c.IdTipoMovimentacao).IsRequired();
            builder.HasOne(c => c.Usuario).WithMany(c => c.Metas).HasForeignKey(c => c.UsuarioId).IsRequired();

            builder.ToTable("Metas");
        }
    }
}
