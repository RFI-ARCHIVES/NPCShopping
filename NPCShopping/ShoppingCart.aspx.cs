using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPCShopping
{
    public partial class ShoppingCart1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShoppingCart sc = (ShoppingCart)Session["Cart"];
            
            GridView1.DataSource = sc.getList();
            GridView1.DataBind();

        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkout.aspx");
        }
    }
}