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
    public partial class usertokenapply : System.Web.UI.Page
    {
        public static string constr = ConfigurationManager.ConnectionStrings["tokendata"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd;
        public string date = DateTime.Now.ToShortDateString();
        public string time = DateTime.Now.ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                BindDropDown();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                vd1.Text =TextBox3.Text;
                Label2.Text = Session["Mobile_No"].ToString();
                Label1.Text = Session["name"].ToString();
                MultiView1.ActiveViewIndex = 1;
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (DropDownList2.SelectedItem.Value != "Please Select Department")
                {
                    Int32 verify;
                    string query1 = "Select count(*) from token1 where token_no='" + DropDownList1.SelectedItem.Value + "' and department='" + DropDownList2.SelectedItem.Value + "'and date='" + vd1.Text + "' ";
                    cmd = new SqlCommand(query1, con);
                    con.Open();
                    verify = Convert.ToInt32(cmd.ExecuteScalar());
                    if (verify > 0)
                    {
                        Response.Write("<script>alert('Token already exist!')</script>");

                    }
                    else
                    {
                         cmd = new SqlCommand("insert into token1 values('" + vd1.Text + "','" + Label2.Text + "','" + DropDownList1.SelectedItem.Value + "','" + Label1.Text + "','" + date + "','" + time + "','" + DropDownList2.SelectedItem.Value + "')", con);

                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Token booked now!')</script>");

                        con.Close();
                        MultiView1.ActiveViewIndex = 0;
                        BindDropDown(vd1.Text, DropDownList2.SelectedItem.Value);
                        TextBox3.Text = "";
                        DropDownList2.ClearSelection();
                        DropDownList1.Items.Clear();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Before select department!')</script>");

                }
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }

        }

        protected void TextBox3_TextChanged1(object sender, EventArgs e)
        {
            TextBox3.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            TextBox3.Attributes["max"] = DateTime.Now.AddDays(5).ToString("yyyy-MM-dd");

        }
        private void checkname()
        {
            string name = Label1.Text;
            if (name.Equals(""))
            {
                MultiView1.ActiveViewIndex = 0;

            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (DropDownList2.SelectedItem.Value != "Please Select Department")
                {
                    BindDropDown(vd1.Text, DropDownList2.SelectedItem.Value);
                }
                else
                {
                    DropDownList1.Items.Clear();
                }
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }

        }

        public void BindDropDown(string DateTime, string name)
        {
            try
            {
                if (DropDownList2.SelectedItem.Value != "Please Select Department")
                {
                    cmd = new SqlCommand("SELECT Top 1 limit FROM department where name = @Name", con);
                    con.Open();
                    cmd.Parameters.AddWithValue("@Name", name);
                    SqlDataAdapter date = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    date.Fill(dt);
                    con.Close();
                    cmd.Dispose();
                    if (dt.Rows.Count > 0)
                    {
                        DropDownList1.Items.Clear();
                        List<ListItem> items = new List<ListItem>();
                        int limit = Convert.ToInt32(dt.Rows[0]["limit"].ToString()) + 1;
                        for (int i = 1; i < limit; i++)
                        {
                            items.Add(new ListItem { Text = i.ToString(), Value = i.ToString() });
                        }
                        cmd = new SqlCommand("SELECT token_no FROM token1 where department = @department and date = @date", con);
                        con.Open();
                        cmd.Parameters.AddWithValue("@department", name);
                        cmd.Parameters.AddWithValue("@date", DateTime);
                        SqlDataAdapter das = new SqlDataAdapter(cmd);
                        DataTable dts = new DataTable();
                        das.Fill(dts);
                        con.Close();
                        cmd.Dispose();
                        if (dts.Rows.Count > 0)
                        {
                            List<ListItem> itemsecond = new List<ListItem>();
                            for (int i = 0; i < dts.Rows.Count; i++)
                            {
                                itemsecond.Add(new ListItem { Text = dts.Rows[i]["token_no"].ToString(), Value = dts.Rows[i]["token_no"].ToString() });
                            }
                            var result = items.Except(itemsecond);
                            DropDownList1.Items.AddRange(result.ToArray());
                        }
                        else
                        {
                            DropDownList1.Items.Clear();

                            DropDownList1.Items.AddRange(items.ToArray());
                        }
                    }
                }
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }
        }

        public void BindDropDown()
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
    }
}