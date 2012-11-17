using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using DAO;
using DTO;

namespace WebServiceTaxyEmp
{
    /// <summary>
    /// Descripción breve de Service1
    /// </summary>
    [WebService(Namespace = "http://localhost/WebServiceTaxyEmp",Name="WebServiceTaxyEmp")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio Web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class ServicioWeb : System.Web.Services.WebService
    {

        [WebMethod]
        public TaxyServicioEntity[] ConsultarServicioRutaDisponiblePorDia(DateTime fecha)
        {
            TaxyServicioDAO oTaxyServicioDAO = new TaxyServicioDAO();
            return oTaxyServicioDAO.ConsultarServicioRutaDisponiblePorDia(fecha);
        }



        [WebMethod]
        public void ReservarServicioRuta(int codUser, int codServicio)
        {
            TaxyReservaDAO oTaxyReservaDAO = new TaxyReservaDAO();

            oTaxyReservaDAO.ReservarServicioRuta(codUser, codServicio);
        }



        [WebMethod]
        public TaxyReservaEntity[] ConsultarServicioRutaDisponiblePorUsuario(int codUser)
        {
            TaxyReservaDAO oTaxyReservaDAO = new TaxyReservaDAO();
            return oTaxyReservaDAO.ConsultarReservasRegistradasPorUsuario(codUser);
        }



        [WebMethod]
        public void CancelarReservaRuta(int codReserva)
        {
            TaxyReservaDAO oTaxyReservaDAO = new TaxyReservaDAO();

            oTaxyReservaDAO.CancelarReservaRuta(codReserva);
        }
            
        }
}