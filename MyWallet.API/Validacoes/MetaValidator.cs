using FluentValidation;
using MyWallet.BLL.Models;

namespace MyWallet.API.Validacoes
{
    public class MetaValidator: AbstractValidator<Meta>
    {
        public MetaValidator()
        {
            RuleFor(c => c.Descricao)
                .NotNull().WithMessage("Informe a descrição da meta")
                .NotEmpty().WithMessage("Informe a descrição da meta")
                .MinimumLength(3).WithMessage("Mínimo requerido de 3 caracteres")
                .MaximumLength(50).WithMessage("Máximo permitido de 50 caracteres");

            RuleFor(c => c.Valor)
                .NotNull().WithMessage("Digite o valor")
                .NotEmpty().WithMessage("Digite o valor")
                .InclusiveBetween(0, double.MaxValue).WithMessage("Valor inválido");

            RuleFor(c => c.IdTipoMovimentacao)
                .NotNull().WithMessage("Informe o Tipo da Movimentação")
                .NotEmpty().WithMessage("Informe o Tipo da Movimentação");

        }
    }
}
