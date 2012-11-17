//Conexion.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    public class Conexion
    {
        public string strCadena;
        public SqlConnection con;

        public Conexion()
        {
            System.Configuration.AppSettingsReader config = new System.Configuration.AppSettingsReader();
            con = new SqlConnection();
            //Data Source=ANDROMEDA\SQL2008R2;Initial Catalog=BDSGCRM;User ID=sa;Password=sqlserver
            this.con.ConnectionString = (@"Data Source=ORION\SQL2008R2;Initial Catalog=TAXY_EMP;User ID=sa;Password=sqlserver");
            strCadena = this.con.ConnectionString;
        }

        public SqlConnection conexion
        {
            get
            {
                return con;
            }
        }

        public string CadenaConexion
        {
            get
            {
                return strCadena;
            }
        }

    }
}
