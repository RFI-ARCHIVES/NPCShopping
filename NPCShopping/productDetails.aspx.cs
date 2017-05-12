using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace NPCShopping
{
    public partial class productDetails : System.Web.UI.Page
    {
        decimal price;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //acquire product id from query string
                SqlDataSource1.SelectParameters.Add("ID", Request.QueryString["productID"]);
                //search database for product with matching product it
                //return a single row of data in a dataview object (Row 0)
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                //pull individual fiels from the dataview row and place them in the textboxes
                tbxName.Text = (string)dv.Table.Rows[0]["name"];
                tbxDescription.Text = (string)dv.Table.Rows[0]["description"];
                productImage.ImageUrl = ".\\productImages\\" + (string)dv.Table.Rows[0]["Image"];
                price = (decimal)dv.Table.Rows[0]["price"];
                tbxPrice.Text = string.Format("{0:c}", price);
                //save price value in a hidden field so that it is available after a page postback for "Add to Cart"
                hdnPrice.Value = price.ToString() ;
                tbxVendor.Text = ((int)dv.Table.Rows[0]["vendor"]).ToString();
            }
        }

  
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            //this method adds the selected items to the shopping cart list

            ShoppingCart sc = (ShoppingCart)Session["Cart"];
            CartItem ci = new CartItem();

            //populate textboxes with cart item details
            ci.ID = Convert.ToInt16(Request.QueryString["productID"]);
            ci.QTY = Convert.ToInt16(tbxItemQty.Text);
            ci.Price = Convert.ToDecimal(hdnPrice.Value);

            //if the selected item is already in the cart, it is not added again
            if (sc.itemExist(ci.ID))
            {
                MessageBox.Show("This item already exists in your shopping cart.");
            }
            else
            {
                //add the item to the cart and save the cart to the Session
                sc.addItem(ci);
                Session["Cart"] = sc;
                //update the cart status
                Master.CartStatus();
                Response.Redirect("products.aspx");

            }
        }

 
    }
}