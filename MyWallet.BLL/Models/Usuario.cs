﻿using Microsoft.AspNetCore.Identity;
using MyWallet.BLL.Models;
using System.Collections.Generic;

namespace ControleFinanceiro.BLL.Models
{
    public class Usuario: IdentityUser<string>
    {
        public string CPF { get; set; }
        public string Profissao { get; set; }
        public byte[] Foto { get; set; }
        public virtual ICollection<Cartao> Cartoes { get; set; }
        public virtual ICollection<Ganho> Ganhos { get; set; }
        public virtual ICollection<Despesa> Despesas { get; set; }
        public virtual ICollection<Reserva> Reservas { get; set; }
        public virtual ICollection<Meta> Metas { get; set; }
    }
}
