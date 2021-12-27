using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RegistrationSystem.Startup))]
namespace RegistrationSystem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
