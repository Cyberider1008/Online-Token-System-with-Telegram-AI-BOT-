using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Configuration;

namespace onlinetokensystem
{
    public partial class forgetpassword : System.Web.UI.Page
    {
        public static string constr = ConfigurationManager.ConnectionStrings["tokendata"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string username = "";
                string password = "";
                cmd = new SqlCommand("select username, password from usrdata1 where email=@email", con);
                cmd.Parameters.AddWithValue("email", emailtxt.Text);
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    if (sdr.Read())
                    {
                        username = sdr["username"].ToString();
                        password = sdr["password"].ToString();

                    }

                }
                con.Close();

                if (!string.IsNullOrEmpty(password))
                {
                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("baranwalashish1120@gmail.com");
                    msg.To.Add(emailtxt.Text);
                    msg.Subject = " Recover your Password";
                    msg.Body = ("Your Username is:" + username + "<br/><br/>" + "Your Password is:" + password);
                    msg.IsBodyHtml = true;

                    SmtpClient smt = new SmtpClient();
                    smt.Host = "smtp.gmail.com";
                    NetworkCredential ntwd = new NetworkCredential("baranwalashish1120@gmail.com", "ashish@432");

                    smt.UseDefaultCredentials = false;
                    smt.Credentials = ntwd;
                    smt.Port = 587;
                    smt.EnableSsl = true;
                    smt.Send(msg);
                    lblmsg.Text = "Username and Password Sent Successfully";
                    lblmsg.ForeColor = System.Drawing.Color.ForestGreen;
                }
                else
                {
                    lblmsg.Text = "This email address is not exist in our Database try again";
                }

            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }

        }
    }
}