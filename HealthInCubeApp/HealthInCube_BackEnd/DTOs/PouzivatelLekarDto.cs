namespace HealthInCube_BackEnd.DTOs
{
    public class PouzivatelLekarDto
    {


        public string Meno { get; set; }
        public string Priezvisko { get; set; }
        public string Mobil { get; set; }
        public string Email { get; set; }

        public string FullName
        {
            get
            {
                return $"{Meno.Trim()} {Priezvisko}";
            }

        }

    }
}