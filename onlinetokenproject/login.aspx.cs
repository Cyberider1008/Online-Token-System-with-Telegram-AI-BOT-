using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace onlinetokensystem
{
    public partial class login : System.Web.UI.Page
    {
        public static string constr = ConfigurationManager.ConnectionStrings["tokendata"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                // Request.Cookies["user"].Expires = DateTime.Now.AddMinutes(-30);
                Request.Cookies.Remove("user");
                Session.RemoveAll();
                Session.Clear();
               }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }
        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (usrtxt.Text.ToUpper() == "ADMIN" && usrpwd.Text.ToUpper() == "ADMIN")
                {
                    Session["userid"] = "1";
                    Session["username"] = "Admin";
                    Session["Role"] = "admin";
                    Session["IsAuth"] = "true";
                    Response.Redirect("~/home.aspx");
                }
                else
                {
                    LoginDetails log = ValidateUser(usrtxt.Text, usrpwd.Text);
                    if (log.IsAuthUser)
                    {
                        Session["userid"] = log.UserId;
                        Session["username"] = log.UserName;
                        Session["Role"] = "user";
                        Session["IsAuth"] = log.IsAuthUser;
                        Response.Redirect("~/home.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/login.aspx");
                     }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }

        }
        private LoginDetails ValidateUser(string username, string password)
        {
            LoginDetails obj = new LoginDetails();
            obj.IsAuthUser = false;
            try
            {
                SqlDataAdapter da;
                DataSet ds = new DataSet();
                string query = "select * from usrdata1 where username='" + username.Trim() + "' and password='" + password.Trim() + "'";
                da = new SqlDataAdapter(query, con);
                con.Open();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    obj.IsAuthUser = true;
                    obj.UserName = ds.Tables[0].Rows[0]["username"].ToString();
                    obj.UserId = int.Parse(ds.Tables[0].Rows[0]["UserId"].ToString());
                    string fname = ds.Tables[0].Rows[0]["fname"].ToString();
                    string lname = ds.Tables[0].Rows[0]["lname"].ToString();
                    string Mobile_No = ds.Tables[0].Rows[0]["Mobile_No"].ToString();
                    string email = ds.Tables[0].Rows[0]["email"].ToString();
                    string state = ds.Tables[0].Rows[0]["state"].ToString();
                    string city = ds.Tables[0].Rows[0]["city"].ToString();
                    Session["state"] = state;
                    Session["city"] = city;
                    Session["email"] = email;
                    Session["name"] = fname + "       " + lname;
                    Session["Mobile_No"] = Mobile_No;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                obj.IsAuthUser = false;
            }
            return obj;
        }
        private struct LoginDetails
        {
            public int UserId { get; set; }
            public string UserName { get; set; }
            public bool IsAuthUser { get; set; }
        }

    }
}