using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Atelier.Server.Data;
using Atelier.Server.Models;

namespace Atelier.Server.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ClientsController : ControllerBase
    {
        private readonly AppDbContext Context;
        public ClientsController(AppDbContext context)
        {
            Context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetClients()
        {
            var clients = await Context.Clients
                .Include(c => c.Specialist)
                .ToListAsync();
            return Ok(clients);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetClient(int id)
        {
            var client = await Context.Clients
                .Include(c => c.Specialist)
                .FirstOrDefaultAsync(c => c.Id == id);

            if (client == null)
                return NotFound();

            return Ok(client);
        }

        [HttpPost]
        public async Task<IActionResult> CreateClient([FromBody] Client client)
        {
            if (client == null)
                return BadRequest();

            Context.Clients.Add(client);
            await Context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetClient), new { id = client.Id }, client);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateClient(int id, [FromBody] Client client)
        {
            if (id != client.Id)
                return BadRequest();

            Context.Entry(client).State = EntityState.Modified;
            await Context.SaveChangesAsync();

            return NoContent();
        }

        [HttpGet("{id}/average-order")]
        public async Task<IActionResult> GetAverageOrderDuration(int id)
        {
            var client = await Context.Clients
                .Include(c => c.Orders)
                .FirstOrDefaultAsync(c => c.Id == id);

            if (client == null)
                return NotFound("Клиент не найден");

            if (client.Orders == null || !client.Orders.Any())
                return Ok(new { ClientId = id, AverageDuration = 0, Message = "Нет заказов" });

            double averageDuration = client.Orders
                .Where(o => o.StartDate != null && o.EndDate != null)
                .Average(o => (o.EndDate - o.StartDate).Value.TotalDays);

            return Ok(new { ClientId = id, AverageDuration = averageDuration });
        }

    }
}