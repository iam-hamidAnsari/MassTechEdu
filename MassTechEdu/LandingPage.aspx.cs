using iTextSharp.tool.xml.html;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MassTechEdu
{
    public partial class LandingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("mpoke1928@gmail.com");
            mail.From = new MailAddress("gauripadir16@gmail.com");
            mail.Subject = $"{TextBox1.Text} wants to contact us";
            mail.Body = $"Here is all details" +
                $"Name : {TextBox1.Text}" +
                $"Email : {TextBox2.Text}" +
                $"Subject : {TextBox3.Text}" +
                $"regards," +
                $"{TextBox1.Text}";

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Port = 587;
            smtp.Credentials = new NetworkCredential("gauripadir16@gmail.com", "nhqg knmi rhok ofof");
            smtp.EnableSsl = true;

            smtp.Send(mail);
        }
    }
}