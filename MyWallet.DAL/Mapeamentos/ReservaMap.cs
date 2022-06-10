using ControleFinanceiro.BLL.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace MyWallet.DAL.Mapeamentos
{
    public class ReservaMap : IEntityTypeConfiguration<Reserva>
    {
        public void Configure(EntityTypeBuilder<Reserva> builder)
        {
            builder.HasKey(c => c.ReservaId);
            builder.Property(c => c.Descricao).IsRequired().HasMaxLength(50);
            builder.Property(c => c.Valor).IsRequired();
            builder.Property(c => c.Dia).IsRequired();
            builder.Property(c => c.Ano).IsRequired();

            builder.HasOne(c => c.Categoria).WithMany(c => c.Reservas).HasForeignKey(c => c.CategoriaId).IsRequired();
            builder.HasOne(c => c.Mes).WithMany(c => c.Reservas).HasForeignKey(c => c.MesId).IsRequired();
            builder.HasOne(c => c.Usuario).WithMany(c => c.Reservas).HasForeignKey(c => c.UsuarioId).IsRequired();

            builder.ToTable("Reservas");
        }
    }
}
