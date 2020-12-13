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
    public partial class missed : System.Web.UI.Page
    {
        public static string constr = ConfigurationManager.ConnectionStrings["tokendata"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd;
        public string date = DateTime.Now.ToString("MM/dd/yyyy");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                BindDropCounter();
                BindDropDepartment();
            }

            this.SearchCustomers();
            con.Open();



        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (DropDownList2.SelectedItem.Value != "Please Select Department")
                {
                    callcustomer();
                }
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (DropDownList1.SelectedItem.Value != "Please Select Operator" && DropDownList2.SelectedItem.Value != "Please Select Department" && DropDownList3.SelectedItem.Value != "Please Select Counter")
                {
                    if (!string.IsNullOrEmpty(TextBox2.Text) && !string.IsNullOrEmpty(Label1.Text))
                    {

                        i++;
                    }
                    else
                    {

                        i = 0;

                    }
                    callcustomer();
                    this.SearchCustomers();
                }
                else
                {
                    Response.Write("<script>alert(' before select department,Operator and counter!')</script>");

                }

            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }
        }
        private void SearchCustomers()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                string sql = "select * from missed where date=@date and department=@department order by token_no asc";
                        cmd.Parameters.AddWithValue("@date", date);
                        cmd.Parameters.AddWithValue("@department", DropDownList2.SelectedItem.Value);
                        cmd.CommandText = sql;
                        cmd.Connection = con;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        GridView1.DataSource = ds;
                        GridView1.DataBind();
                        con.Close();

            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.SearchCustomers();
        }
        protected void Search(object sender, EventArgs e)
        {
            this.SearchCustomers();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (DropDownList1.SelectedItem.Value != "Please Select Operator" && DropDownList2.SelectedItem.Value != "Please Select Department" && DropDownList3.SelectedItem.Value != "Please Select Counter")
                {
                    if (!string.IsNullOrEmpty(TextBox2.Text) && !string.IsNullOrEmpty(Label1.Text))
                    {

                        string quary = "insert into call1 values(@department,@token_no,@counter,@date,@operator,@name,@mobile_no)";
                        cmd = new SqlCommand(quary, con);
                        cmd.Parameters.AddWithValue("@department", DropDownList2.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@token_no", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@counter", DropDownList3.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@date", date);
                        cmd.Parameters.AddWithValue("@operator", DropDownList1.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@name", Label1.Text);
                        cmd.Parameters.AddWithValue("@mobile_no", hiddentxt.Value);
                        cmd.ExecuteNonQuery();
                        cmd.Dispose();

                        deletequary();

                    }
                    else
                    {
                        Response.Write("<script>alert(' not any token issue!')</script>");

                    }

                    callcustomer();
                    this.SearchCustomers();

                }
                else
                {
                    Response.Write("<script>alert(' before select department,operator and counter!')</script>");

                }
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }
        }
        public void deletequary()
        {
            try
            {
                string quary = "delete from missed where date=@date and department=@department and token_no=@token_no and name=@name";
                cmd = new SqlCommand(quary, con);
                cmd.Parameters.AddWithValue("@department", DropDownList2.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@token_no", TextBox2.Text);
                cmd.Parameters.AddWithValue("@date", date);
                cmd.Parameters.AddWithValue("@name", Label1.Text);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }
        }

        private static int i = 0;
        public void callcustomer()
        {

            try
            {
                string sql = "select token_no,name,mobile_no from missed where date=@date and department=@department order by token_no asc";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@date", date);
                cmd.Parameters.AddWithValue("@department", DropDownList2.SelectedItem.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                cmd.Dispose();
                if (dt.Rows.Count > i)
                {

                    TextBox2.Text = dt.Rows[i][0].ToString();
                    Label1.Text = dt.Rows[i][1].ToString();
                    hiddentxt.Value = dt.Rows[i][2].ToString();


                }
                else
                {
                    TextBox2.Text = "";
                    Label1.Text = "";
                    hiddentxt.Value = "";


                }

                Session["Token_Number"] = TextBox2.Text;
                Session["department"] = DropDownList2.SelectedItem.Text;
                Session["counter"] = DropDownList3.SelectedItem.Text;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
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
                DropDownList2.DataSource = dt;
                DropDownList2.DataTextField = "name";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("Please Select Department", "0"));

            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }

        }
        public void BindDropCounter()
        {
            try
            {
                cmd = new SqlCommand("SELECT coname FROM counter", con);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dt = new DataSet();
                da.Fill(dt);
                con.Close();
                cmd.Dispose();
                DropDownList3.DataSource = dt;
                DropDownList3.DataTextField = "coname";
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, new ListItem("Please Select Counter", "0"));

            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }

        }

    }


}