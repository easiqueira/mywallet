using ControleFinanceiro.BLL.Models;
using FluentValidation;

namespace MyWallet.API.Validacoes
{
    public class ReservaValidator : AbstractValidator<Reserva>
    {
        public ReservaValidator()
        {
            RuleFor(g => g.CategoriaId)
                .NotNull().WithMessage("Escolha a categoria")
                .NotEmpty().WithMessage("Escolha a categoria");

            RuleFor(d => d.Descricao)
                .NotNull().WithMessage("Preencha a descrição")
                .NotEmpty().WithMessage("Preencha a descrição")
                .MinimumLength(2).WithMessage("Use mais caracteres")
                .MaximumLength(50).WithMessage("Use mais caracteres");

            RuleFor(d => d.Valor)
                .NotNull().WithMessage("Preencha o valor")
                .NotEmpty().WithMessage("Preencha o valor")
                .InclusiveBetween(0, double.MaxValue).WithMessage("Valor inválido");

            RuleFor(d => d.MesId)
                .NotEmpty().WithMessage("Escolha o mês")
                .NotNull().WithMessage("Escolha o mês");

            RuleFor(d => d.Ano)
               .NotNull().WithMessage("Preencha o ano")
               .NotEmpty().WithMessage("Preencha o ano")
               .InclusiveBetween(2015, 2099).WithMessage("Valor inválido");
        }
    }
}
