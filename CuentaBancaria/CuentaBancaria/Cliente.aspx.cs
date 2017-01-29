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
                cargarEstados();
                cargarEdoCivil();
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
          
           Double saldo = Convert.ToDouble( txtSaldoIni.Text);

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
           else {
               string mensaje = "alert('Seleccione la informacion correctamente');";
               ScriptManager.RegisterClientScriptBlock(upPrincipal, upPrincipal.GetType(), "Error", mensaje, true);
           }
        }
    }
}