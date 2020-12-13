using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinetokensystem
{
    public partial class account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Session["Role"].Equals("admin"))
            {
                Label1.Text = "admin";
                Label2.Text = "";
                Label3.Text = "";
            }
            else
            {
                Label1.Text = Session["name"].ToString();
                Label2.Text = Session["city"].ToString();
                Label3.Text = Session["state"].ToString();
            }
        }
    }
}