using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NPCShopping
{
    public class UserAcct
    {
        private int userID;
        private string name;
        private string role;
        private string email;

        public int UserID
        {
            get
            {
                return userID;
            }

            set
            {
                userID = value;
            }
        }
        public string Name
        {
            get
            {
                return name;
            }

            set
            {
                name = value;
            }
        }
        public string Role
        {
            get
            {
                return role;
            }

            set
            {
                role = value;
            }
        }
        public string Email
        {
            get
            {
                return email;
            }

            set
            {
                email = value;
            }
        }

    //public string Name
    //{
    //    get 
    //    {
    //       return myName; 
    //    }
    //    set 
    //    {
    //       myName = value; 
    //    }
    //}

        



    }
}