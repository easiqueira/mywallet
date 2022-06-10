using Microsoft.EntityFrameworkCore;
using MyWallet.BLL.Models;
using MyWallet.DAL.Interfaces;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Repositorios
{
    public class MetaRepositorio: RepositorioGenerico<Meta>, IMetaRepositorio
    {
        private readonly Contexto _contexto;

        public MetaRepositorio(Contexto contexto): base(contexto)
        {
            _contexto = contexto;
        }

        public new IQueryable<Meta> ObterTodos()
        {
            try
            {
                return _contexto.Metas.Include(c => c.TipoMovimentacao);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public new async Task<Meta> ObterPeloId(int id)
        {
            try
            {
                return await _contexto.Metas.Include(c => c.TipoMovimentacao).FirstOrDefaultAsync(c => c.IdMeta == id);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IQueryable<Meta> ObterMetasPeloUsuarioId(string usuarioId)
        {
            try
            {
                return _contexto.Metas.Include(d => d.TipoMovimentacao).Where(d => d.UsuarioId == usuarioId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public IQueryable<Meta> FiltrarMetas(string descricao)
        {
            try
            {
                return _contexto.Metas.Include(c => c.TipoMovimentacao).Where(c => c.Descricao.Contains(descricao));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IQueryable<Meta> ObterMetasPeloTipoMovimentacao(string tipo)
        {
            try
            {
                return _contexto.Metas.Include(c => c.TipoMovimentacao).Where(c => c.TipoMovimentacao.Nome == tipo);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
