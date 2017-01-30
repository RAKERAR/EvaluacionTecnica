using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessRules;
using System.Globalization;

namespace CuentaBancaria
{
    public partial class Cliente : System.Web.UI.Page
    {
        private GeneralBR gral = new GeneralBR();

        protected void Page_Load(object sender, EventArgs e)
        {
            hfEjecutivo.Value = Request.QueryString["ejec"].ToString();
            if (!IsPostBack)
            {
                inicializarControles(false);
                txtID.Enabled = true;
                comportamientoBotones(eBotonOpciones.INICIO);
                inicializarCamposNumericos();
                cargarEstados();
                cargarEdoCivil();
            }
        }

        public enum eBotonOpciones
        {
            INICIO,
            NUEVO,
            EDITAR,
            GUARDAR,
            BUSCAR,
            CANCELAR
        }
        public void comportamientoBotones(eBotonOpciones boton)
        {
            switch (boton)
            {
                case eBotonOpciones.INICIO:
                    btnNuevo.Enabled = true;
                    btnEditar.Enabled = false;
                    btnBuscar.Enabled = true;
                    btnGuadar.Enabled = false;
                    btnCancelar.Enabled = true;
                    break;
                case eBotonOpciones.NUEVO:
                    btnNuevo.Enabled = false;
                    btnEditar.Enabled = false;
                    btnBuscar.Enabled = true;
                    btnGuadar.Enabled = true;
                    btnCancelar.Enabled = true;
                    break;
                case eBotonOpciones.BUSCAR:
                    btnNuevo.Enabled = false;
                    btnEditar.Enabled = true;
                    btnBuscar.Enabled = false;
                    btnGuadar.Enabled = false;
                    btnCancelar.Enabled = true;
                    break;
                case eBotonOpciones.EDITAR:
                    btnNuevo.Enabled = false;
                    btnBuscar.Enabled = false;
                    btnGuadar.Enabled = true;
                    btnCancelar.Enabled = true;
                    btnEditar.Enabled = false;
                    break;
                case eBotonOpciones.GUARDAR:
                    btnEditar.Enabled = true;
                    btnBuscar.Enabled = false;
                    btnGuadar.Enabled = false;
                    btnCancelar.Enabled = true;
                    btnNuevo.Enabled = true;
                    break;
                case eBotonOpciones.CANCELAR:
                    btnNuevo.Enabled = true;
                    btnBuscar.Enabled = true;
                    btnEditar.Enabled = false;
                    btnGuadar.Enabled = false;
                    btnCancelar.Enabled = true;
                    break;

            }
        }

        protected void inicializarCamposNumericos()
        {
            txtSaldoIni.Attributes.Add("onKeyPress", " return soloNumeros(event,true)");
            txtTarjeta.Attributes.Add("onKeyPress", " return soloNumeros(event,true)");
            txtTelefono.Attributes.Add("onKeyPress", " return soloNumeros(event,true)");
            txtCelular.Attributes.Add("onKeyPress", " return soloNumeros(event,true)");
        }
   
        protected void cargarEstados()
        {
            DataTable dtEstados = gral.obtenerEstado();
            ddlEstado.DataSource = dtEstados;
            ddlEstado.DataValueField = "Id";
            ddlEstado.DataTextField = "Estado";
            ddlEstado.DataBind();
            ddlEstado.Items.Insert(0, "SELECCIONAR");
            ddlEstado.Items[0].Value = "";
        }

        protected void cargarEdoCivil()
        {
            DataTable dtEdoCivil = gral.obtenerEdoCivil();
            ddlEstadoCivil.DataSource = dtEdoCivil;
            ddlEstadoCivil.DataValueField = "Id";
            ddlEstadoCivil.DataTextField = "Descripcion";
            ddlEstadoCivil.DataBind();
            ddlEstadoCivil.Items.Insert(0, "SELECCIONAR");
            ddlEstadoCivil.Items[0].Value = "";



        }

        protected void btnGuadar_Click(object sender, EventArgs e)
        {
           string ejecutivo = hfEjecutivo.Value;
           if (txtID.Text == String.Empty)
           {
               Double saldo = Convert.ToDouble(txtSaldoIni.Text);

               if (ddlEstado.SelectedValue != "" && ddlEstadoCivil.SelectedValue != "" && ddlSexo.SelectedValue != "")
               {
                   DataTable dtCliente = gral.guardarCliente(txtNombre.Text, txtApellidos.Text, txtTarjeta.Text, txtDireccion.Text,
                                                            Convert.ToInt16(ddlEstado.SelectedValue), txtCP.Text, Convert.ToInt16(ddlSexo.SelectedValue),
                                                            Convert.ToInt16(ddlEstadoCivil.SelectedValue), txtCelular.Text, txtTelefono.Text, "",
                                                            Convert.ToInt16(txtEdad.Text), ejecutivo, saldo);

                   txtID.Text = dtCliente.Rows[0]["Id"].ToString();
                   txtID.Enabled = false;
                   string mensaje = "alert('Guardado Correctamente! ');";
                   ScriptManager.RegisterClientScriptBlock(upPrincipal, upPrincipal.GetType(), "Error", mensaje, true);
               }
               else
               {
                   string mensaje = "alert('Seleccione la informacion correctamente');";
                   ScriptManager.RegisterClientScriptBlock(upPrincipal, upPrincipal.GetType(), "Error", mensaje, true);
               }
           }
           else//Actualizará
           {
               if (ddlEstado.SelectedValue != "" && ddlEstadoCivil.SelectedValue != "" && ddlSexo.SelectedValue != "")
               {
                   gral.actualizarCliente(Convert.ToInt16(txtID.Text), txtNombre.Text, txtApellidos.Text, txtTarjeta.Text, txtDireccion.Text,
                                                            Convert.ToInt16(ddlEstado.SelectedValue), txtCP.Text, Convert.ToInt16(ddlSexo.SelectedValue),
                                                            Convert.ToInt16(ddlEstadoCivil.SelectedValue), txtCelular.Text, txtTelefono.Text, "",
                                                            Convert.ToInt16(txtEdad.Text));
               }
           }
           comportamientoBotones(eBotonOpciones.GUARDAR);
           inicializarControles(false);
       
           txtID.Enabled = true;

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            inicializarControles(true);
            txtID.Enabled = false;
            comportamientoBotones(eBotonOpciones.NUEVO);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {  
            if (txtID.Text != String.Empty)
            {
                DataTable dtCliente = gral.obtenerCliente(Convert.ToInt16(txtID.Text));
                cargarDatos(dtCliente);
                comportamientoBotones(eBotonOpciones.BUSCAR);
                
            }
            else
            {
                string mensaje = "alert('¡Debe ingresar un Numero de cliente!');";
                ScriptManager.RegisterClientScriptBlock(upPrincipal, upPrincipal.GetType(), "Error", mensaje, true);
            }
            inicializarControles(false);
            comportamientoBotones(eBotonOpciones.BUSCAR);
            txtID.Enabled = false;
        }
      
        protected void cargarDatos(DataTable dt)
        {
            txtNombre.Text = dt.Rows[0]["Nombre"].ToString();
            txtTarjeta.Text = dt.Rows[0]["NumTarjeta"].ToString();
            txtEdad.Text = dt.Rows[0]["Edad"].ToString();
            ddlEstadoCivil.SelectedValue = dt.Rows[0]["Id_EdoCivil"].ToString();
            txtDireccion.Text = dt.Rows[0]["Direccion"].ToString();
            ddlEstado.SelectedValue = dt.Rows[0]["Id_Estado"].ToString();
            txtTelefono.Text = dt.Rows[0]["Telefono"].ToString();
            txtCelular.Text = dt.Rows[0]["Celular"].ToString();
            txtApellidos.Text = dt.Rows[0]["Apellidos"].ToString();
            ddlSexo.SelectedValue = dt.Rows[0]["Id_Sexo"].ToString();
            txtCP.Text = dt.Rows[0]["CodigoPostal"].ToString();
            txtCorreoElectronico.Text = dt.Rows[0]["CorreoElectronico"].ToString();
            txtSaldoIni.Text = dt.Rows[0]["SaldoInicial"].ToString();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            inicializarControles(true);
            txtID.Enabled = false;
            txtSaldoIni.Enabled = false;
            comportamientoBotones(eBotonOpciones.EDITAR);
        }

        protected void inicializarControles(Boolean opc)
        {
            txtID.Enabled = opc;
            txtTarjeta.Enabled = opc;
            txtSaldoIni.Enabled = opc;
            txtNombre.Enabled = opc;
            txtApellidos.Enabled = opc;
            txtEdad.Enabled = opc;
            ddlSexo.Enabled = opc;
            ddlEstadoCivil.Enabled = opc;
            ddlEstado.Enabled = opc;
            txtCorreoElectronico.Enabled = opc;
            txtDireccion.Enabled = opc;
            txtCP.Enabled = opc;
            txtTelefono.Enabled = opc;
            txtCelular.Enabled = opc;
        }
        protected void LimpiarCampos()
        {
            foreach (Control ctrl in pRegistro.Controls)
            {
                if (ctrl is TextBox)
                {
                    TextBox txt = ctrl as TextBox;
                    txt.Text = String.Empty;
                }
                if (ctrl is DropDownList)
                {
                    DropDownList ddl = ctrl as DropDownList;
                    ddl.SelectedIndex = 0;
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            comportamientoBotones(eBotonOpciones.CANCELAR);
            inicializarControles(false);
            txtID.Enabled = true;
            LimpiarCampos();
        }
    }
}