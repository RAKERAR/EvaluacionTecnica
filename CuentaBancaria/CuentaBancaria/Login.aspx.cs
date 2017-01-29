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
    public partial class Login : System.Web.UI.Page
    { private GeneralBR gral = new GeneralBR();

        protected void Page_Load(object sender, EventArgs e)
        {
            string s = String.Empty;
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            DataTable dtUsuario = gral.validarUsuario(Login1.UserName, Login1.Password);
            if (dtUsuario.Rows.Count > 0)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {//MArca el error
                Label logError = ((Label)Login1.FindControl("FailureText"));
                logError.Visible = true;
                //((Label)Login1.FindControl("FailureText")).Text = "Usuario y/o contraseña incorrectos";
                String s = String.Empty;
                //((Literal)Login1.FailureText2).Text = "Usuario y/o contraseña incorrectos";
            }
            
        }

        protected void Password_TextChanged(object sender, EventArgs e)
        {

        }
    }
}