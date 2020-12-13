using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace tokenproject
{
    public partial class counter : System.Web.UI.Page
    {
      public static  string constr = ConfigurationManager.ConnectionStrings["tokendata"].ConnectionString;

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
                        string sql = "SELECT * FROM counter";
                        if (!string.IsNullOrEmpty(TextBox1.Text.Trim()))
                        {
                            sql += " WHERE coname LIKE @coname + '%'";
                            cmd.Parameters.AddWithValue("@coname", TextBox1.Text.Trim());
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
        protected void Search(object sender, EventArgs e)
        {
            this.SearchCustomers();
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
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constr);
               
                Int32 verify;
                string query = "Select count(*) from counter where coname='" + TextBox2.Text + "'  ";
                SqlCommand cmd1 = new SqlCommand(query, con);
                con.Open();
                verify = Convert.ToInt32(cmd1.ExecuteScalar());

                if (verify > 0)
                {
                    Response.Write("<script>alert('counter already exist!')</script>");

                }
                else
                {
                    SqlCommand cmd = new SqlCommand("insert into counter values('" + TextBox2.Text.ToLower() + "')", con);

                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('counter booked now!')</script>");
                    con.Close();
                }
                TextBox2.Text = "";
                MultiView1.ActiveViewIndex = 0;
                SearchCustomers();
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }
        }
    }
}