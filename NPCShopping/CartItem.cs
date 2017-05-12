using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NPCShopping
{
    public class CartItem
    {
        private int id;
        private int qty;
        private decimal price;

        public int ID
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public int QTY
        {
            get
            {
                return qty;
            }

            set
            {
                qty = value;
            }
        }

        public decimal Price
        {
            get
            {
                return price;
            }

            set
            {
                price = value;
            }
        }

    }
}