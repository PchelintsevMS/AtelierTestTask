namespace Atelier.Server.Models
{
    public class Specialist
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public ICollection<Client> Clients { get; set; } = new List<Client>();
    }
}
