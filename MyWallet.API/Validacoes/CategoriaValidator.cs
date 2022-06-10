using ControleFinanceiro.BLL.Models;
using FluentValidation;

namespace MyWallet.API.Validacoes
{
    public class CategoriaValidator: AbstractValidator<Categoria>
    {
        public CategoriaValidator()
        {
            RuleFor(c => c.Nome)
                .NotNull().WithMessage("Informe o nome da categoria")
                .NotEmpty().WithMessage("Informe o nome da categoria")
                .MinimumLength(3).WithMessage("Mínimo requerido de 3 caracteres")
                .MaximumLength(50).WithMessage("Máximo permitido de 50 caracteres");

            RuleFor(c => c.Icone)
                .NotNull().WithMessage("Informe o ícone da categoria")
                .NotEmpty().WithMessage("Informe o ícone da categoria")
                .MinimumLength(1).WithMessage("Mínimo requerido de 1 caracter")
                .MaximumLength(15).WithMessage("Máximo permitido de 15 caracteres");

            RuleFor(c => c.IdTipoMovimentacao)
                .NotNull().WithMessage("Informe o Tipo da categoria")
                .NotEmpty().WithMessage("Informe o Tipo da categoria");
                
        }
    }
}
