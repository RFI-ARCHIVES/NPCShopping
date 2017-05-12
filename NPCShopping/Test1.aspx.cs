using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPCShopping
{
    public partial class Test1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserAcct user;
            user = (UserAcct)Session["User"];
            lblUserName.Text = user.Name;
            lblRole.Text = user.Role;
        }
    }
}