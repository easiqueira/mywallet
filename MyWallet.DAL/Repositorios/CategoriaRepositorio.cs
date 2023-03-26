using ControleFinanceiro.BLL.Models;
using Microsoft.EntityFrameworkCore;
using MyWallet.DAL.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Repositorios
{
    public class CategoriaRepositorio: RepositorioGenerico<Categoria>, ICategoriaRepositorio
    {
        private readonly Contexto _contexto;

        public CategoriaRepositorio(Contexto contexto): base(contexto)
        {
            _contexto = contexto;
        }

        public new IQueryable<Categoria> ObterTodos()
        {
            try
            {
                return _contexto.Categorias.Include(c => c.TipoMovimentacao);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public new async Task<Categoria> ObterPeloId(int id)
        {
            try
            {
                var entity = await _contexto.Categorias.Include(c => c.TipoMovimentacao).FirstOrDefaultAsync(c => c.CategoriaId == id);
                return entity;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IQueryable<Categoria> FiltrarCategorias(string nomeCategoria)
        {
            try
            {
                var entity = _contexto.Categorias.Include(c => c.TipoMovimentacao).Where(c => c.Nome.Contains(nomeCategoria));
                return entity;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IList<Categoria> ObterCategoriasPeloTipo(string tipo)
        {
            try
            {
                return _contexto.Categorias.Include(c => c.TipoMovimentacao).Where(c => c.TipoMovimentacao.Nome == tipo).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
