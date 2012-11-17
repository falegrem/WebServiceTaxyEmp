using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DTO
{
    public class TaxyServicioEntity
    {

        public int CodServicio { get; set; }
        public string DesRutaIni { get; set; }
        public string DesRutaFin { get; set; }
        public decimal CostoRuta { get; set; }
        public DateTime FecServicio { get; set; }

        public TaxyServicioEntity()
        {
            //this.CodServicio = 0;
            //this.DesRutaIni = "";
            //this.DesRutaFin = "";
            //this.CostoRuta = 0;
            //this.FecServicio = ;
        }


        public TaxyServicioEntity(int codServicio, string desRutaIni, string desRutaFin, decimal costoRuta, DateTime fecServicio)
        {
            this.CodServicio = codServicio;
            this.DesRutaIni = desRutaIni;
            this.DesRutaFin = desRutaFin;
            this.CostoRuta = costoRuta;
            this.FecServicio = fecServicio;
        }

    }
}
