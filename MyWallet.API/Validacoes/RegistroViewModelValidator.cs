using FluentValidation;
using MyWallet.API.ViewModels;

namespace MyWallet.API.Validacoes
{
    public class RegistroViewModelValidator : AbstractValidator<RegistroViewModel>
    {
        public RegistroViewModelValidator()
        {
            RuleFor(r => r.NomeUsuario)
                .NotNull().WithMessage("Preencha o nome de usuario")
                .NotEmpty().WithMessage("Preencha o nome de usuario")
                .MinimumLength(6).WithMessage("Use mais caracteres")
                .MaximumLength(50).WithMessage("Use menos caracteres");

            RuleFor(r => r.CPF)
                .NotNull().WithMessage("Preencha o CPF")
                .NotEmpty().WithMessage("Preencha o CPF")
                .MinimumLength(11).WithMessage("Use mais caracteres")
                .MaximumLength(14).WithMessage("Use menos caracteres");

            RuleFor(r => r.Profissao)
               .NotNull().WithMessage("Preencha a profissão")
               .NotEmpty().WithMessage("Preencha a profissão")
               .MinimumLength(3).WithMessage("Use mais caracteres")
               .MaximumLength(30).WithMessage("Use menos caracteres");

            RuleFor(f => f.Foto)
                .NotNull().WithMessage("Escolha a foto")
                .NotEmpty().WithMessage("Escolha a foto");

            RuleFor(r => r.Email)
               .NotNull().WithMessage("Preencha o email")
               .NotEmpty().WithMessage("Preencha o email")
               .MinimumLength(10).WithMessage("Use mais caracteres")
               .MaximumLength(50).WithMessage("Use menos caracteres")
               .EmailAddress().WithMessage("Email inválido");

            RuleFor(r => r.Senha)
              .NotNull().WithMessage("Preencha a senha")
              .NotEmpty().WithMessage("Preencha a senha")
              .MinimumLength(6).WithMessage("Use mais caracteres")
              .MaximumLength(30).WithMessage("Use menos caracteres");


        }
    }
}
