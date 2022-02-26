namespace HealthInCube_BackEnd.DTOs.Nemocnica
{
    public class OddelenieDto
    {
        public decimal IdOddel { get; set; }
        public decimal IdNem { get; set; }
        public decimal? IdPrimar { get; set; }
        public string NazovOdd { get; set; }
        // public ICollection<Lekar> Lekars { get; set; }
    }
}