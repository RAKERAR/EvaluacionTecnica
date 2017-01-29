using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using System.IO;
using System.Data;

namespace BusinessRules
{
   public class GeneralBR
    {

       GeneralDAL grl = new GeneralDAL();

       public DataTable validarUsuario(string id_usuario, string pass)
       {
         return  grl.grlValidarUsuario(id_usuario, pass);
       }

       public DataTable obtenerEstado()
       {
           return grl.grlObtenerEstados();
       }

    }
}
