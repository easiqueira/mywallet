using MyWallet.DAL.Interfaces;
using System;
using System.Linq;

namespace MyWallet.DAL.Repositorios
{
    public class GraficoRepositorio : IGraficoRepositorio
    {
        private readonly Contexto _contexto;
        public GraficoRepositorio(Contexto contexto)
        {
            _contexto = contexto;
        }
        public object ObterDespesasAnuaisPeloUsuarioId(string usuarioId, int ano)
        {
            try
            {
                return _contexto.Despesas
                    .Where(d => d.UsuarioId == usuarioId && d.Ano == ano)
                    .OrderBy(d => d.Mes.MesId)
                    .GroupBy(d => d.Mes.MesId)
                    .Select(d => new
                    {
                        MesId = d.Key,
                        Valores = d.Sum(x => x.Valor)
                    });
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public object ObterGanhosAnuaisPeloUsuarioId(string usuarioId, int ano)
        {
            try
            {
                return _contexto.Ganhos
                    .Where(g => g.UsuarioId == usuarioId && g.Ano == ano)
                    .OrderBy(g => g.Mes.MesId)
                    .GroupBy(g => g.Mes.MesId)
                    .Select(g => new
                    {
                        MesId = g.Key,
                        Valores = g.Sum(x => x.Valor)
                    });
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
