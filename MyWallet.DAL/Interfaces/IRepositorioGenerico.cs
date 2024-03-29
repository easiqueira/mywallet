﻿using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWallet.DAL.Interfaces
{
    public interface IRepositorioGenerico<TEntity> where TEntity: class
    {
        IQueryable<TEntity> ObterTodos();
        Task<TEntity> ObterPeloId(int id);
        Task<TEntity> ObterPeloId(string id);
        Task Inserir(TEntity entity);
        Task Inserir(IList<TEntity> entity);
        Task Atualizar(TEntity entity);
        Task Excluir(int id);
        Task Excluir(string id);
        Task Excluir(TEntity entity);
    }
}
