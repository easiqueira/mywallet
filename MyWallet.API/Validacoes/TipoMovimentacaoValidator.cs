using ControleFinanceiro.BLL.Models;
using FluentValidation;

namespace MyWallet.API.Validacoes
{
    public class TipoMovimentacaoValidator : AbstractValidator<TipoMovimentacao>
    {
        public TipoMovimentacaoValidator()
        {
            RuleFor(c => c.Nome)
                .NotNull().WithMessage("Informe o nome do tipo da movimentação")
                .NotEmpty().WithMessage("Informe o nome do tipo da movimentação")
                .MinimumLength(3).WithMessage("Mínimo requerido de 3 caracteres")
                .MaximumLength(50).WithMessage("Máximo permitido de 20 caracteres");
        }
    }
}
