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

       public DataTable grlObtenerEdoCivil()
       {
           StoreProcedure procedure = new StoreProcedure("paObtenerEdoCivil");
           return procedure.GetDataSet().Tables[0];
       }

       public DataTable grlInsertarCliente(string nombre,string apellidos, string NumeroTarjeta, string Direccion,
                                            int idEstado, string codigoPostal, int id_Sexo, int id_edocivil, string celular,
                                            string telefono, string correo, int edad, string idEjecutivo, Double saldoini )
       {
           StoreProcedure procedure = new StoreProcedure("pa_InsertarCliente");
           procedure.AddInParameter("@Nombre", DbType.String, nombre);
           procedure.AddInParameter("@Apellidos", DbType.String, apellidos);
           procedure.AddInParameter("@NumeroTarjeta", DbType.String, NumeroTarjeta);
           procedure.AddInParameter("@Direccion", DbType.String, Direccion);
           procedure.AddInParameter("@Id_Estado", DbType.Int32, idEstado);
           procedure.AddInParameter("@CodigoPostal", DbType.String, codigoPostal);
           procedure.AddInParameter("@Id_Sexo", DbType.Int32, id_Sexo);
           procedure.AddInParameter("@Id_EdoCivil", DbType.Int32, id_edocivil);
           procedure.AddInParameter("@Celular", DbType.String, celular);
           procedure.AddInParameter("@Telefono", DbType.String, telefono);
           procedure.AddInParameter("@CorreoElectronico", DbType.String, correo);
           procedure.AddInParameter("@Edad", DbType.Int32, edad);
           procedure.AddInParameter("@Id_Ejecutivo", DbType.String, idEjecutivo);
           procedure.AddInParameter("@SaldoInicial", DbType.Double, saldoini);
           return procedure.GetDataSet().Tables[0];
       }
       public void grlActualizarCliente(int id_cliente, string nombre, string apellidos, string NumeroTarjeta, string Direccion,
                                         int idEstado, string codigoPostal, int id_Sexo, int id_edocivil, string celular,
                                         string telefono, string correo, int edad)
       {
           StoreProcedure procedure = new StoreProcedure("pa_ActualizarCliente");
           procedure.AddInParameter("@Id_Cliente", DbType.Int16, id_cliente);
           procedure.AddInParameter("@Nombre", DbType.String, nombre);
           procedure.AddInParameter("@Apellidos", DbType.String, apellidos);
           procedure.AddInParameter("@NumeroTarjeta", DbType.String, NumeroTarjeta);
           procedure.AddInParameter("@Direccion", DbType.String, Direccion);
           procedure.AddInParameter("@Id_Estado", DbType.Int32, idEstado);
           procedure.AddInParameter("@CodigoPostal", DbType.String, codigoPostal);
           procedure.AddInParameter("@Id_Sexo", DbType.Int32, id_Sexo);
           procedure.AddInParameter("@Id_EdoCivil", DbType.Int32, id_edocivil);
           procedure.AddInParameter("@Celular", DbType.String, celular);
           procedure.AddInParameter("@Telefono", DbType.String, telefono);
           procedure.AddInParameter("@CorreoElectronico", DbType.String, correo);
           procedure.AddInParameter("@Edad", DbType.Int32, edad);
           procedure.Execute();
          
       }

       public DataTable grlObtenerCliente(int id)
       {
           StoreProcedure procedure = new StoreProcedure("pa_ObtenerCliente");
           procedure.AddInParameter("@Id_Cliente", DbType.Int16, id);
           return procedure.GetDataSet().Tables[0];

       }
    }
}
