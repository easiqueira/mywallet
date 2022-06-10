using ControleFinanceiro.BLL.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyWallet.DAL.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MyWallet.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MesesController : ControllerBase
    {
        private readonly IMesRepositorio _mesRepositorio;

        public MesesController(IMesRepositorio mesRepositorio)
        {
            _mesRepositorio = mesRepositorio;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Mes>>> GetMeses()
        {
            return await _mesRepositorio.ObterTodos().ToListAsync();
        }
    }
}
