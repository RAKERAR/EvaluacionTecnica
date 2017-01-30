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
    public partial class Movimientos : System.Web.UI.Page
    {
        private GeneralBR gral = new GeneralBR();

        protected void Page_Load(object sender, EventArgs e)
        {
            hfCajero.Value = Request.QueryString["caj"].ToString();
            if (!IsPostBack)
            {
                cargarTiposMovimientos();
                List<string> lista = new List<string>();
                gvMovimiento.DataSource = lista;
                gvMovimiento.DataBind();

                txtCliente.Attributes.Add("onKeyPress", " return soloNumeros(event,true)");
                txtMonto.Attributes.Add("onKeyPress", " return soloNumeros(event,true)");
                txtSaldo.Attributes.Add("onKeyPress", " return soloNumeros(event,true)");
            }
        }


        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable dtCliente = gral.obtenerCliente(Convert.ToInt16(txtCliente.Text));
            lblCliente.Text = dtCliente.Rows[0]["Nombre"].ToString() + dtCliente.Rows[0]["Apellidos"].ToString();
            hfIdCliente.Value = dtCliente.Rows[0]["Id"].ToString();
            hfCuenta.Value = dtCliente.Rows[0]["NumTarjeta"].ToString();

            DataTable dtMovimientos = gral.obtenerMovimientosCliente(Convert.ToInt16(txtCliente.Text));
            gvMovimiento.DataSource = dtMovimientos;
            gvMovimiento.DataBind();

            txtSaldo.Text = obtenerSaldoCliente(Convert.ToInt16( dtCliente.Rows[0]["Id"].ToString())).ToString();

        }

        protected Decimal obtenerSaldoCliente(int id_Cliente)
        {
            Decimal saldo;
            DataTable dtSaldo = gral.obtenerSaldoCliente(id_Cliente);
            saldo = Convert.ToDecimal( dtSaldo.Rows[0]["SALDO"].ToString());

            return saldo;
        }
        protected void cargarTiposMovimientos()
        {
           DataTable dtTipos = gral.obtenerTiposMovimiento();
           ddlMovimiento.DataSource = dtTipos;
           ddlMovimiento.DataValueField = "Id";
           ddlMovimiento.DataTextField = "TipoMovimiento";
           ddlMovimiento.DataBind();
           ddlMovimiento.Items.Insert(0, "SELECCIONAR");
           ddlMovimiento.Items[0].Value = "";
        }

        protected void btnGuadar_Click(object sender, EventArgs e)
        {
            if (ddlMovimiento.SelectedValue != "")
            {
                if (txtMonto.Text != String.Empty )
                {
                    if (ddlMovimiento.SelectedValue == "2" || (ddlMovimiento.SelectedValue == "3" && Convert.ToDouble(txtMonto.Text) < Convert.ToDouble(txtSaldo.Text)))
                    {
                        gral.guardarMovimientoCliente(Convert.ToInt16(hfIdCliente.Value), Convert.ToDouble(hfCuenta.Value), Convert.ToInt16(ddlMovimiento.SelectedValue), Convert.ToDouble(txtMonto.Text));

                        DataTable dtMovimientos = gral.obtenerMovimientosCliente(Convert.ToInt16(txtCliente.Text));
                        gvMovimiento.DataSource = dtMovimientos;
                        gvMovimiento.DataBind();

                        string mensaje = "alert('¡Movimiento registrado!');";
                        ScriptManager.RegisterClientScriptBlock(upPrincipal, upPrincipal.GetType(), "Error", mensaje, true);
                    }
                    else {
                        string mensaje = "alert('¡No cuenta con los fondos suficientes para el retiro!');";
                        ScriptManager.RegisterClientScriptBlock(upPrincipal, upPrincipal.GetType(), "Error", mensaje, true);
                    }
                }
                else {
                    string mensaje = "alert('¡Debe ingresar un importe!');";
                    ScriptManager.RegisterClientScriptBlock(upPrincipal, upPrincipal.GetType(), "Error", mensaje, true);
                }
            }
            else {
                string mensaje = "alert('¡Debe seleccionar un tipo de movimiento!');";
                ScriptManager.RegisterClientScriptBlock(upPrincipal, upPrincipal.GetType(), "Error", mensaje, true);
            }


        }
    }
}