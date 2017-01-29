using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace DataAccessLayer
{
   public class GeneralDAL
    {

       public DataTable grlValidarUsuario(string id_usuario, string contrasena)
       {
           StoreProcedure procedure = new StoreProcedure("pa_ObtenerUsuarios");
           procedure.AddInParameter("@Usuario", DbType.String, id_usuario);
           procedure.AddInParameter("@Pass", DbType.String, contrasena);
           return procedure.GetDataSet().Tables[0];
       }

       public DataTable grlObtenerEstados()
       {
           StoreProcedure procedure = new StoreProcedure("pa_ObtenerEstados");
           return procedure.GetDataSet().Tables[0];
       }
    }
}
