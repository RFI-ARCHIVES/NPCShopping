using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPCShopping
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //redirects to the details page with the selected product ID
            Response.Redirect("productDetails.aspx?productID=" + (int)GridView1.SelectedDataKey.Value);

        }

        protected void btnShoppingCart_Click(object sender, EventArgs e)
        {
            //redirects to the shopping cart page
            Response.Redirect("sc.aspx");

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //re-populates the gridview based on the product category id selected in the dropdown
            SqlDataSource1.SelectParameters.Remove(SqlDataSource1.SelectParameters["CatID"]);
            SqlDataSource1.SelectCommand = "Select * from [Product] where Category = @CatID";
            SqlDataSource1.SelectParameters.Add("CatID", DropDownList1.SelectedValue);
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //re-populates the gridview with products that have names like the text in the textbox 
            SqlDataSource1.SelectParameters.Remove(SqlDataSource1.SelectParameters["srchTxt"]);
            SqlDataSource1.SelectCommand = "Select * from [Product] where name like '%" + TextBox1.Text + "%'";
            //SqlDataSource1.SelectParameters.Add("srchTxt", TextBox1.Text);
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            GridView1.DataBind();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string imageName = "";
            if(GridView1.SelectedRow != null)
            {
              imageName = GridView1.SelectedRow.Cells[3].Text;
              e.Row.Attributes.Add("onmouseover", "getElementById('quickView').src='../productImages/" + imageName + "';");
            } 
        }

       
    }
}