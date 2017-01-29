using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessRules;

namespace CuentaBancaria
{
    public partial class Cliente : System.Web.UI.Page
    {
        private GeneralBR gral = new GeneralBR();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cargarEstados()
        {
            DataTable dtEstados = gral.obtenerEstado();
           ddlEstado.DataSource
        }
    }
}