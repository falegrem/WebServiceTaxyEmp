using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DTO;
using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    public class TaxyServicioDAO : Conexion
    {

        public TaxyServicioEntity[] ConsultarServicioRutaDisponiblePorDia(DateTime fecha)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SP_ConsultarServicioRutaDisponiblePorDia";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@fecha", System.Data.SqlDbType.DateTime).Value = fecha;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();

            SqlDataReader reader = cmd.ExecuteReader();

            List<TaxyServicioEntity> lista = new List<TaxyServicioEntity>();
            while (reader.Read())
            {
                lista.Add(new TaxyServicioEntity(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetDecimal(3), reader.GetDateTime(4)));

            }
            cmd.Connection.Close();
            return lista.ToArray();
        }



        

    }
}
