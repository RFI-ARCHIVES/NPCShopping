using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPCShopping
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
             * Calls local methods to update login and cart status lables on Master page
             */
            LoginStatus();
            CartStatus();
            
        }

        public void enableAdmin()
        {
            //Allows other pages to enable the Admin link
            hlAdmin.Visible = true;
        }

        public void enableLogout()
        {
            //Allows other pages to enable the Logout link
            hlLogout.Visible = true;
        }

        public void LoginStatus()
        {
            //Verifies the User object exists and updates labels with user name and status
            UserAcct user = new UserAcct();
            user = (UserAcct)Session["User"];

            if (user == null)
            {

                lblLoginStatus.Text = "" + "NOT Logged In";
            }
            else
            {
                lblLoginStatus.Text = user.Name + ": " + "Logged In";
                hlLogout.Visible = true;
                //if User is Admin, ebable the ADMIN link
                if (user.Role == "admin")
                    hlAdmin.Visible = true;
            }
        }


        public void CartStatus()
        {
            //Checks that shopping cart object exists
            //Updates cart count
            ShoppingCart sc = new ShoppingCart();
            sc = (ShoppingCart)Session["Cart"];

            if (sc == null)
            {

                lblCartStatus.Text = "Cart is Empty";
            }
            else
            {
                lblCartStatus.Text = "Item Count:" + sc.cartCount();
            }
        }

    }
}