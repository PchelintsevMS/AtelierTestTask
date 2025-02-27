namespace Atelier.Server.Data
{
    using Microsoft.EntityFrameworkCore;
    using Atelier.Server.Models;

    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
        public DbSet<Client> Clients { get; set; }
        public DbSet<Specialist> Specialists { get; set; }
        public DbSet<Order> Orders { get; set; }
    }
}
