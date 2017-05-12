using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPCShopping.AdminPages
{
    public partial class addProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserAcct user = new UserAcct();
            user = (UserAcct)Session["User"];

            if (user == null)
            {
                Response.Redirect("..\\login.aspx");
            }
            else
            {
                if (user.Role != "admin")
                {
                    Response.Redirect("..\\login.aspx");
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
        }
    }
}