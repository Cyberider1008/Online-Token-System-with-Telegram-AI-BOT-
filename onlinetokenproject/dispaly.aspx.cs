using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Script.Serialization;

namespace onlinetokensystem
{
    class Api
    {
        public static string apiToken = "1113002139:AAER2cf-x9qAKpu1UQjvD7h-QeqacQ1Wtss";
        public static string chatId = "@help_ashish";
        public int message_id, update_id;
        public long chat_id;
        public string message_text, send_text;

            public void received()
        {
            string urlString = "https://api.telegram.org/bot{0}/getUpdates?chat_id={1}&offset=-1";
            urlString = String.Format(urlString, apiToken, chatId);
            var webclient = new WebClient();
            string urljson = webclient.DownloadString(urlString);
            var resultcollection = new JavaScriptSerializer().Deserialize<Rootobject>(urljson);
            // count = resultcollection.result.Count();
            chat_id = resultcollection.result[0].message.chat.id;
            message_id = resultcollection.result[0].message.message_id;
            message_text = resultcollection.result[0].message.text;
            update_id = resultcollection.result[0].update_id;
        }
        public void send()
        {
            string urlString = "https://api.telegram.org/bot{0}/sendMessage?chat_id={1}&text={2}&parse_mode={3}";
            string parse = "html";
            urlString = String.Format(urlString, apiToken, chatId, send_text,parse);
            WebClient webclient = new WebClient();
            webclient.DownloadString(urlString);
        }
    }

    public partial class dispaly : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] == null)
            {
                Response.Redirect("login.aspx");
            }

        } 
        private static int limit = 0;
        protected void Timer1_Tick1(object sender, EventArgs e)
        {
            try
            {
                if (Session["Token_Number"] != null)
                {
                    Label2.Text = Session["Token_Number"].ToString();
                }
                if (Session["department"] != null)
                {
                    Label1.Text = Session["department"].ToString();
                }
                if (Session["counter"] != null)
                {
                    Label3.Text = Session["counter"].ToString();
                }
            }
            catch(Exception ex)
            {
                Console.Write(ex.Message);
            }
            try
            {
                Api api = new Api();
                api.received();

                if (limit <= api.update_id)
                {
                    if (api.message_text.ToLower().Trim() == "help")
                    {
                        api.send_text ="<strong>Help:</strong>\n1.what current token number as a type:token\n 2.what current department name as a type department\n3.what current counter name as a type counter\n";
                        api.send();
                        limit = api.update_id + 1;
                    }
                    else if (api.message_text.ToLower().Trim() == "token") 
                    {
                        if (Label2.Text != null)
                        {
                            api.send_text = "current Token: <strong><u>" + Label2.Text + "</u></strong>";
                            api.send();
                            limit = api.update_id + 1;

                        }
                        else
                        {
                            api.send_text = "<strong><u> display is not working</u></strong>";
                            api.send();
                            limit = api.update_id + 1;
                        }

                    }
                    else if (api.message_text.ToLower().Trim() == "department")
                    {
                        if (Label1.Text != null)
                        {
                            api.send_text = "current Department: <strong><u> " + Label1.Text + "</u></strong>";
                            api.send();
                            limit = api.update_id + 1;

                        }
                        else
                        {
                            api.send_text = "<strong> display is not working</strong>";
                            api.send();
                            limit = api.update_id + 1;

                        }


                    }
                    else if (api.message_text.ToLower().Trim() == "counter")
                    {
                        if (Label1.Text != null)
                        {
                            api.send_text = "current Counter: <strong><u> " + Label3.Text + "</u></strong>";
                            api.send();
                            limit = api.update_id + 1;

                        }
                        else
                        {
                            api.send_text = "<strong><u> display is not working</u></strong>";
                            api.send();
                            limit = api.update_id + 1;

                        }
                    }
                }
            }
            catch(Exception ex)
            {
                Console.Write(ex.Message);
            }
        }
    }
    }