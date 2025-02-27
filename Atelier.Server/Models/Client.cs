namespace Atelier.Server.Models
{
    public class Client
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public int SpecialistId { get; set; }
        public Specialist Specialist { get; set; }
        public List<Order> Orders { get; set; } = new List<Order>();
    }

}
