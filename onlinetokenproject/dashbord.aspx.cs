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
    public partial class dashbord : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                BindDropDepartment();
               
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (DropDownList1.SelectedItem.Value != "Please Select Department")
                {
                        drop();
                    
                }
                else
                {
                    tq.Text = "";
                    ts.Text = "";
                    tm.Text = "";
                    rq.Text = "";
                }
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }
        }

        private void drop()
        {
            try
            {
                DateTime c = DateTime.Now;
                string dat = c.ToShortDateString();
                int a;
                int b;

                string d1 = DropDownList1.SelectedItem.Value;

               string sql = "Select count(*) from token1 where date='" + dat + "'and  department='" + d1 + "'   ; Select count(*) from call1 where date='" + dat + "'and  department='" + d1 + "' ; Select count(*) from missed where date='" + dat + "'and  department='" + d1 + "'  ";

                try
                {
                    con.Open();
                    cmd = new SqlCommand(sql, con);
                    SqlDataReader sqlReader = cmd.ExecuteReader();
                    if (sqlReader.Read())
                    {
                        string val = sqlReader[0].ToString();
                        if (val == "")
                        {
                            tq.Text = "0";
                        }
                        else
                        {
                            a = Convert.ToInt32(sqlReader[0].ToString());

                            tq.Text = a.ToString();

                        }

                    }

                    sqlReader.NextResult();
                    if (sqlReader.Read())
                    {
                        string val = sqlReader[0].ToString();
                        if (val == "")
                        {
                            ts.Text = "0";
                        }
                        else
                        {
                            b = Convert.ToInt32(sqlReader[0].ToString());

                            ts.Text = b.ToString();

                        }

                    }

                    sqlReader.NextResult();
                    if (sqlReader.Read())
                    {
                        string val = sqlReader[0].ToString();
                        if (val == "")
                        {
                            rq.Text = "0";
                        }
                        else
                        {
                            b = Convert.ToInt32(sqlReader[0].ToString());

                            rq.Text = b.ToString();

                        }
                    }

                    sqlReader.Close();
                    cmd.Dispose();
                    con.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);

                }
                int t = Convert.ToInt32(tq.Text);
                int d = Convert.ToInt32(ts.Text);
                int q;
                q = t - d;
                if (q > -1)
                {
                    tm.Text = Convert.ToString(q);
                }
                else
                {
                    tm.Text = "0";

                }

            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }

        }
        public void BindDropDepartment()
        {
            try
            {
                cmd = new SqlCommand("SELECT name FROM department", con);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dt = new DataSet();
                da.Fill(dt);
                con.Close();
                cmd.Dispose();
                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "name";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Please Select Department", "0"));
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }

        }

    }
}
