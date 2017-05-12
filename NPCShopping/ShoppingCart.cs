using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NPCShopping
{

    public class ShoppingCart
    {
        List<CartItem> sc;


        public List<CartItem> getList()
        {
            return sc;

        }


        public ShoppingCart()
        {
          sc = new List<CartItem>();

        }
  

        public void addItem(CartItem ci)
        {
            sc.Add(ci);

        }

        public int cartCount()
        {
            return sc.Count();

        }

       public bool itemExist(int id)
        {
            foreach (CartItem ci in sc)
            {
                if (ci.ID == id)
                    return true;
            }
            return false;

        }








    }


    
}