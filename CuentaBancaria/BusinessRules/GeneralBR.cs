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

       public DataTable obtenerEdoCivil()
       {
           return grl.grlObtenerEdoCivil();
       }

       public DataTable guardarCliente(string nombre, string apellidos, string NumeroTarjeta, string Direccion,
                                            int idEstado, string codigoPostal, int id_Sexo, int id_edocivil, string celular,
                                            string telefono, string correo, int edad, string idEjecutivo, Double saldoini)
       {
           return grl.grlInsertarCliente(nombre, apellidos, NumeroTarjeta, Direccion, idEstado, codigoPostal, 
                                          id_Sexo, id_edocivil, celular, telefono, correo, edad, idEjecutivo, saldoini);
       }

       public void actualizarCliente(int id, string nombre, string apellidos, string NumeroTarjeta, string Direccion,
                                            int idEstado, string codigoPostal, int id_Sexo, int id_edocivil, string celular,
                                            string telefono, string correo, int edad)
       {
            grl.grlActualizarCliente(id, nombre, apellidos, NumeroTarjeta, Direccion, idEstado, codigoPostal, 
                                          id_Sexo, id_edocivil, celular, telefono, correo, edad);
       }

       public DataTable obtenerCliente(int idCliente)
       {
           return grl.grlObtenerCliente(idCliente);
       }

       public DataTable obtenerTiposMovimiento()
       {
           return grl.grlObtenerTiposMovimiento();
       }
       public DataTable obtenerMovimientosCliente(int id_Cliente)
       {
           return grl.grlObtenerMovimientosCliente(id_Cliente);
       }
       public void guardarMovimientoCliente(int id_Cliente, double numeroCuenta, int id_TipoMov, double importe)
       {
           grl.grlInsertarMovimientoCliente(id_Cliente, numeroCuenta, id_TipoMov, importe);
       }
       public DataTable obtenerSaldoCliente(int id_Cliente)
       {
           return grl.grlObtenerSaldoCliente(id_Cliente);
       }
    }
}
