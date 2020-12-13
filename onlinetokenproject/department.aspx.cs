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
    public partial class department : System.Web.UI.Page
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
            this.SearchCustomers();
        }

        private void SearchCustomers()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        string sql = "SELECT * FROM department";
                        if (!string.IsNullOrEmpty(TextBox1.Text.Trim()))
                        {
                            sql += " WHERE name LIKE @name + '%'";
                            cmd.Parameters.AddWithValue("@name", TextBox1.Text.Trim());
                        }
                        cmd.CommandText = sql;
                        cmd.Connection = con;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }

        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.SearchCustomers();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            try
            {
                Int32 verify;
                string query1 = "Select count(*) from department where name='" + TextBox2.Text + "' ";
                cmd = new SqlCommand(query1, con);
                con.Open();
                verify = Convert.ToInt32(cmd.ExecuteScalar());

                if (verify > 0)
                {
                    Response.Write("<script>alert('department already exist!')</script>");

                }
                else
                {
                    SqlCommand cmd = new SqlCommand("insert into department values('" + TextBox2.Text + "','" + TextBox3.Text + "')", con);

                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('department booked now!')</script>");
                    cmd.Dispose();
                    con.Close();
                    con.Dispose();

                }
                TextBox2.Text = "";
                TextBox3.Text = "";
                SearchCustomers();
                MultiView1.ActiveViewIndex = 0;
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            this.SearchCustomers();
        }
    }
}