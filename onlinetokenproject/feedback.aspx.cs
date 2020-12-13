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
    public partial class feedback : System.Web.UI.Page
    {
        public static string constr = ConfigurationManager.ConnectionStrings["tokendata"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                string s = experiancedown.SelectedItem.Text;
                DateTime c = DateTime.Now;
                string date = c.ToShortDateString();

                Int32 verify;
                string query1 = "Select count(*) from feedbackdata where name='" + nametxt.Text + "' and email='" + emailtxt.Text + "'and date='" + date + "' ";
                cmd = new SqlCommand(query1, con);
                con.Open();
                verify = Convert.ToInt32(cmd.ExecuteScalar());

                if (verify > 0)
                {
                    Response.Write("<script>alert('Today feedback already exist!')</script>");

                }
                else
                {
                    string InsertQuery = "insert into feedbackdata values(@name,@email,@experiance,@description,@date)";
                    cmd = new SqlCommand(InsertQuery, con);
                    cmd.Parameters.AddWithValue("@name",nametxt.Text);
                    cmd.Parameters.AddWithValue("@email",emailtxt.Text);
                    cmd.Parameters.AddWithValue("@experiance",s);
                    cmd.Parameters.AddWithValue("@date",date);
                    cmd.Parameters.AddWithValue("@description", descriptiontxt.Text);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    Response.Write("<script>alert('data insert successfully!')</script>");
                    con.Close();
                    con.Dispose();
                }
                descriptiontxt.Text = "";
                nametxt.Text = "";
                emailtxt.Text = "";
                experiancedown.ClearSelection();
            }
            catch (Exception ex) {
                Console.WriteLine(ex.Message);
            }
        }

    }
}