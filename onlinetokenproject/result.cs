using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace onlinetokensystem
{

    public class Rootobject
    {
        public bool ok { get; set; }
        public Result[] result { get; set; }
    }

    public class Result
    {
        public int update_id { get; set; }
        public Message message { get; set; }
    }

    public class Message
    {
        public int message_id { get; set; }
        public From from { get; set; }
        public Chat chat { get; set; }
        public int date { get; set; }
        public string text { get; set; }
        public New_Chat_Participant new_chat_participant { get; set; }
        public New_Chat_Member new_chat_member { get; set; }
        public New_Chat_Members[] new_chat_members { get; set; }
        public Left_Chat_Participant left_chat_participant { get; set; }
        public Left_Chat_Member left_chat_member { get; set; }
        public Reply_To_Message reply_to_message { get; set; }
    }

    public class From
    {
        public int id { get; set; }
        public bool is_bot { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string language_code { get; set; }
    }

    public class Chat
    {
        public long id { get; set; }
        public string title { get; set; }
        public string username { get; set; }
        public string type { get; set; }
    }

    public class New_Chat_Participant
    {
        public int id { get; set; }
        public bool is_bot { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string username { get; set; }
    }

    public class New_Chat_Member
    {
        public int id { get; set; }
        public bool is_bot { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string username { get; set; }
    }

    public class Left_Chat_Participant
    {
        public int id { get; set; }
        public bool is_bot { get; set; }
        public string first_name { get; set; }
        public string username { get; set; }
    }

    public class Left_Chat_Member
    {
        public int id { get; set; }
        public bool is_bot { get; set; }
        public string first_name { get; set; }
        public string username { get; set; }
    }

    public class Reply_To_Message
    {
        public int message_id { get; set; }
        public From1 from { get; set; }
        public Chat1 chat { get; set; }
        public int date { get; set; }
        public string text { get; set; }
    }

    public class From1
    {
        public int id { get; set; }
        public bool is_bot { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
    }

    public class Chat1
    {
        public long id { get; set; }
        public string title { get; set; }
        public string username { get; set; }
        public string type { get; set; }
    }

    public class New_Chat_Members
    {
        public int id { get; set; }
        public bool is_bot { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string username { get; set; }
    }


}