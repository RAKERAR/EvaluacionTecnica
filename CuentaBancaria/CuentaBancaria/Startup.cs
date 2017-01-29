using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CuentaBancaria.Startup))]
namespace CuentaBancaria
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
