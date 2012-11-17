using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DTO;
using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    public class TaxyReservaDAO:Conexion
    {

        public int ReservarServicioRuta(int codUser, int codServicio)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "SP_ReservarServicioRuta";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@cod_user", System.Data.SqlDbType.Int).Value = codUser;
                cmd.Parameters.Add("@cod_servicio", System.Data.SqlDbType.Int).Value = codServicio;
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                return 1;
            }
            catch (Exception)
            {
                return 0;
            }
        }





        public TaxyReservaEntity[] ConsultarReservasRegistradasPorUsuario(int user)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SP_ConsultarReservasRegistradasPorUsuario";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@cod_user", System.Data.SqlDbType.Int).Value = user;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();

            SqlDataReader reader = cmd.ExecuteReader();

            List<TaxyReservaEntity> lista = new List<TaxyReservaEntity>();
            while (reader.Read())
            {
                lista.Add(new TaxyReservaEntity(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2), reader.GetDateTime(3), reader.GetDecimal(4), reader.GetString(5),
                reader.GetString(6), reader.GetString(7), reader.GetString(8), reader.GetDateTime(9)));

            }
            cmd.Connection.Close();
            return lista.ToArray();
        }




        public int CancelarReservaRuta(int codReserva)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "SP_CancelarReservaRuta";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@cod_reserva", System.Data.SqlDbType.Int).Value = codReserva;
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                return 1;
            }
            catch (Exception)
            {
                return 0;
            }
        }

    }
}
