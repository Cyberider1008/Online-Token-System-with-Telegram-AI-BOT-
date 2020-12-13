using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinetokensystem
{
    public partial class menumaster : System.Web.UI.MasterPage
    {
        public string myrole1 = "";
        public string myrole = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            try
            {
                if (Convert.ToBoolean(Session["IsAuth"]))
                {
                    switch (Session["Role"].ToString())
                    {
                        case "admin":
                            myrole = "<li><a href='home.aspx'><i class='fa fa-home'></i><span class='bot-line'></span>Home</a></li><li><a href='dashbord.aspx'><i class='fa fa-tachometer-alt'></i><span class='bot-line'></span>Dashboard</a></li>";
                            myrole1 = "<li><a href='tokenapply.aspx'>Token Apply</a></li><li><a href ='call.aspx'>Call</a></li><li><a href='department.aspx'>Department</a></li><li><a href='counter.aspx'>Counter</a></li><li><a href ='missed.aspx'>Missed Token</a></li>";
                            HyperLink1.Text = "Admin";
                            HyperLink2.Text = "Admin";
                            HyperLink3.Text = "Admin";
                            HyperLink4.Text = "Admin";
                            Label1.Text = "admin@domain.com";
                            Label2.Text = "admin@domain.com";
                            break;
                        case "user":
                            myrole = "<li><a href='home.aspx'><i class='fa fa-home'></i><span class='bot-line'></span>Home</a></li><li><a href ='feedback.aspx'><i class='fa fa-comment'></i><span class='bot-line'></span>Feedback</a></li>";
                            myrole1 = "<li><a href='usertokenapply.aspx'>Token Apply</a></li>";
                           HyperLink1.Text = Session["name"].ToString();
                            HyperLink2.Text = Session["name"].ToString();
                            HyperLink3.Text = Session["name"].ToString();
                            HyperLink4.Text = Session["name"].ToString();
                            Label1.Text= Session["email"].ToString();
                            Label2.Text = Session["email"].ToString();
                            break;
                        default:
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
               // Response.Redirect("login.aspx");
            }
        }

    }
}