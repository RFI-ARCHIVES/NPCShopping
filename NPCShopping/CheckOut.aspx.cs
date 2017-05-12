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
    public partial class CheckOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int UserID = 0;
            int TransID = getTransID();

            //get user object from session and save userid to be used later when saving transaction information to db
            UserAcct user = new UserAcct();
            user = (UserAcct)Session["User"];

            if (user == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                UserID = user.UserID;
            }
        
            //get shopping cart from Session, redirect to products page if it is empty
            ShoppingCart sc = new ShoppingCart();
            sc = (ShoppingCart)Session["Cart"];

            if (sc == null)
            {
                Response.Redirect("products.aspx");  
            }
            else
            {
                //if there are items in the shopping cart
                if(sc.cartCount() > 0)
                {
                    foreach (CartItem ci in sc.getList())
                    {
                        //populate insert parameters with product data, userID and transactionID
                        SqlDataSource1.InsertParameters.Add("UserID", UserID.ToString());
                        SqlDataSource1.InsertParameters.Add("ProdID", ci.ID.ToString());
                        SqlDataSource1.InsertParameters.Add("Date", DateTime.Now.ToString());
                        SqlDataSource1.InsertParameters.Add("ProdPrice", ci.Price.ToString());
                        SqlDataSource1.InsertParameters.Add("Quanity", ci.QTY.ToString());
                        SqlDataSource1.InsertParameters.Add("TransID", TransID.ToString());
                        SqlDataSource1.Insert();
                        //clear insertparameters array so that that parameters can be added for next item onlist
                        SqlDataSource1.InsertParameters.Clear();
                    }
                }
            }
        }

            private int getTransID()
            {

            //uses the getLastTran stored procedure to find the highest transaction ID in the database
            //returns that value incremented by one, used as transaction id for next transaction
            SqlConnection sqlConnection1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPCShoppingConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            int returnValue;

            cmd.CommandText = "getLastTrans";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlConnection1;

            sqlConnection1.Open();

            returnValue = (int)cmd.ExecuteScalar();

            sqlConnection1.Close();
            return returnValue+1;
            }

 
        }
    }
