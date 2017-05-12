using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPCShopping
{
    public partial class LinqTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NPCDBDataContext db = new NPCDBDataContext();
            foreach (Product p in db.Products)
            {
                DropDownList1.Items.Add(p.Name);
                int? q = 0;
                db.checkLogin1("jedi", "jedi", ref q);
                DropDownList1.Items.Add(q.ToString());
            }
            foreach (User u in db.Users)
            {
                DropDownList1.Items.Add(u.name);
            }
        }
    }
} 