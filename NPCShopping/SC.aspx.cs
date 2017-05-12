using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace NPCShopping
{
    public partial class SC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            ShoppingCart sc = (ShoppingCart)Session["Cart"];
            List<CartItem> itemList = sc.getList();
            DataView dv;
            DataTable dt = new DataTable();
            int totalItems = 0;
            decimal totalValue = 0;

            dt.Columns.Add(new DataColumn("Name", typeof(string)));
            dt.Columns.Add(new DataColumn("Description", typeof(string)));
            dt.Columns.Add(new DataColumn("Image", typeof(string)));
            dt.Columns.Add(new DataColumn("Price", typeof(string)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(int)));
            dt.Columns.Add(new DataColumn("Total", typeof(string)));

            foreach (CartItem ci in itemList)
            {
                SqlDataSource1.SelectParameters.Add("ID", ci.ID.ToString());
                dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                DataRow dr = dt.NewRow();
                dr["Name"] = dv.Table.Rows[0]["Name"];
                dr["Description"] = dv.Table.Rows[0]["Description"];
                dr["Image"] = "\\productImages\\" + dv.Table.Rows[0]["Image"];
                decimal price = (decimal)dv.Table.Rows[0]["Price"];
                dr["Price"] = String.Format("{0:c}", price);
                dr["Quantity"] = ci.QTY;
                totalItems += ci.QTY;
                decimal total = price * ci.QTY;
                dr["Total"] = String.Format("{0:c}",total);
                totalValue += total;

                dt.Rows.Add(dr);

                SqlDataSource1.SelectParameters.Remove(SqlDataSource1.SelectParameters["ID"] );
            }
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            lblTotalQty.Text = totalItems.ToString();
            lblTotalPrice.Text = totalValue.ToString("c");
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkout.aspx");
        }

    }
}