using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace NPCShopping
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
             * Loads the user object from the session variable, makes sure that it exists, calls 
             * LoginStatus method on Master page to display current login status
             */
             
            UserAcct user = new UserAcct();
            user = (UserAcct)Session["User"];

            if (user == null)
            {
                 //Requires <%@ MasterType  virtualPath="~/Site1.master"%> directive in Login.aspx
                Master.LoginStatus();
            }
            else
            {
                Master.LoginStatus();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            /*
             * Searches the user table for a matching user name and password
             * Populates the user object and saves it in the Session
             * Creates a shopping cart object and saves it in the Session
             * If user is ADMIN, enable Admin link on Master page
             */
            UserAcct user = new UserAcct();
            ShoppingCart cart = new ShoppingCart();
            DataView dv;

            dv = (DataView)sqldsSubmit.Select(DataSourceSelectArguments.Empty);

            try
            {
                user.UserID = (int)dv.Table.Rows[0][0];
                user.Name = (string)dv.Table.Rows[0][1];
                user.Role = (string)dv.Table.Rows[0][2];
                user.Email = (string)dv.Table.Rows[0][3];
                Session["User"] = user;
                Session["Cart"] = cart;
                Master.enableLogout();
                if (user.Role == "admin")
                {
                Master.enableAdmin();
                }
                Response.Redirect("products.aspx");
            }
            catch
            {
                Label3.Text = "Invalid Login, please try again!";
            }
        }
    }
}