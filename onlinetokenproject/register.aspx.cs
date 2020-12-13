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
    public partial class register : System.Web.UI.Page
    {
        public static string constr = ConfigurationManager.ConnectionStrings["tokendata"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            { 
                int a = Convert.ToInt32(t3.Text);
                Int32 verify;
                string query1 = "Select count(*) from usrdata1 where Mobile_No='" + t7.Text + "' and email='" + t4.Text + "'";
                 cmd = new SqlCommand(query1, con);
                con.Open();
                verify = Convert.ToInt32(cmd.ExecuteScalar());

                if (verify > 0)
                {
                    Response.Write("<script>alert('user already exist!')</script>");
                    t1.Text = "";
                    t2.Text = "";
                    t4.Text = "";
                }
                else
                {
                    cmd = new SqlCommand("insert into usrdata1 values('" + t1.Text + "','" + t2.Text + "','" + a + "','" + t4.Text + "','" + t5.Text + "','" + t7.Text + "','" + usrtxt.Text + "','" + RadioButtonList1.SelectedValue + "','" + statedown.SelectedItem.Value + "','" + citytxt.Text + "')", con);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    Response.Write("<script>alert('Your details have been saved successfully.')</script>");
                    con.Close();
                    Response.Redirect("login.aspx");
                    t1.Text = "";
                    t2.Text = "";
                    t3.Text = "";
                    t4.Text = "";
                    t5.Text = "";
                    t6.Text = "";
                    t7.Text = "";
                    usrtxt.Text = "";
                    citytxt.Text = "";
                    RadioButtonList1.ClearSelection();

                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }
    }

}