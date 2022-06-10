using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyWallet.BLL.Models;
using MyWallet.DAL.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MyWallet.API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class MetasController : ControllerBase
    {
        private readonly IMetaRepositorio _metaRepositorio;
        public MetasController(IMetaRepositorio metaRepositorio)
        {
            _metaRepositorio = metaRepositorio;
        }

        [HttpGet("ObterMetasPeloUsuarioId/{usuarioId}")]
        public async Task<ActionResult<IEnumerable<Meta>>> ObterMetasPeloUsuarioId(string usuarioId)
        {
            return await _metaRepositorio.ObterMetasPeloUsuarioId(usuarioId).ToListAsync();
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Meta>>> GetMetas()
        {
            return await _metaRepositorio.ObterTodos().ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Meta>> GetMeta(int id)
        {
            var meta = await _metaRepositorio.ObterPeloId(id);

            if (meta == null)
            {
                return NotFound();
            }

            return meta;
        }

        [HttpPost]
        public async Task<ActionResult<Meta>> PostMeta(Meta meta)
        {
            if (ModelState.IsValid)
            {
                await _metaRepositorio.Inserir(meta);
                return Ok(new
                {
                    mensagem = $"Meta { meta.Descricao } inserida com sucesso!"
                });
            }

            return BadRequest(ModelState);
        }


        [HttpPut("{id}")]
        public async Task<IActionResult> PutMeta(int id, Meta meta)
        {
            if (id != meta.IdMeta)
            {
                return BadRequest();
            }

            if (ModelState.IsValid)
            {
                await _metaRepositorio.Atualizar(meta);
                return Ok(new
                {
                    mensagem = $"Meta { meta.Descricao } atualizada com sucesso!"
                });
            }

            return BadRequest(ModelState);
        }


        [HttpDelete("{id}")]
        public async Task<ActionResult<Meta>> DeleteMeta(int id)
        {
            var meta = await _metaRepositorio.ObterPeloId(id);
            if(meta == null)
            {
                return NotFound();
            }

            await _metaRepositorio.Excluir(id);

            return Ok(new
            {
                mensagem = $"Meta { meta.Descricao } excluída com sucesso!"
            });
        }

        [HttpGet("FiltrarMetas/{descricao}")]
        public async Task<ActionResult<IEnumerable<Meta>>> FiltrarMetas(string descricao)
        {
            return await _metaRepositorio.FiltrarMetas(descricao).ToListAsync();
        }

       
    }
}
