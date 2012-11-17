using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DTO
{
    public class TaxyReservaEntity
    {

        public int CodReserva { get; set; }
        public int CodUser { get; set; }
        public int CodServicio { get; set; }
        public DateTime FecReserva { get; set; }        
        public decimal CostoRuta { get; set; }
        public string EstReserva { get; set; }

        public string NomUser { get; set; }
        public string DesRutaIni { get; set; }
        public string DesRutaFin { get; set; }
        public DateTime FecServicio { get; set; }

        public TaxyReservaEntity()
        {

        }


        public TaxyReservaEntity(int codReserva, int codUser, int codServicio, DateTime fecReserva, decimal costoRuta, string estReserva,
            string nomUser, string desRutaIni, string desRutaFin, DateTime fecServicio)
        {
            this.CodReserva = codReserva;
            this.CodUser = codUser;
            this.CodServicio = codServicio;
            this.FecReserva = fecReserva;
            this.CostoRuta = costoRuta;
            this.EstReserva = estReserva;

            this.NomUser = nomUser;
            this.DesRutaIni = desRutaIni;
            this.DesRutaFin = desRutaFin;
            this.FecServicio = fecServicio;

        }



    }
}
