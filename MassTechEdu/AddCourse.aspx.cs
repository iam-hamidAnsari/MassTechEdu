using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MassTechEdu
{
    public partial class AddCourse : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string courseName = TextBox1.Text;
            string courseImage = FileUpload1.FileName;
            string courseDescription = TextBox2.Text;
            if (FileUpload1.HasFile)
            {
                courseImage = "CourseImage/"+FileUpload1.FileName;
                string filePath = Server.MapPath("CourseImage/") + FileUpload1.FileName;
                FileUpload1.SaveAs(filePath);
            }


            string q = $"exec AddCourse '{courseName}','{courseImage}','{courseDescription}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Course added successfully And Sent Mail to All Users')</script>");


            List<string> UserEmails = new List<string>();
            string query = $"exec SelectAllEmails";
            SqlCommand cmd2 = new SqlCommand(query, conn);
            SqlDataReader rdr = cmd2.ExecuteReader();
            while (rdr.Read())
            {
                UserEmails.Add(rdr["email"].ToString());
            }
            rdr.Close();


            string subject = "New Course Added in portal: " + courseName;
            string body = "Dear User A new course, " + courseName + ", has been added. Check it out!";


            foreach (string email in UserEmails)
            {
                SendEmail(email, subject, body);
            }

        }
        public void SendEmail(string toEmail, string subject, string body)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(toEmail);
            mail.From = new MailAddress("gauripadir16@gmail.com");
            mail.Subject = subject;
            mail.Body = body;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Port = 587;
            smtp.Credentials = new NetworkCredential("gauripadir16@gmail.com", "nhqg knmi rhok ofof");
            smtp.EnableSsl = true;

            smtp.Send(mail);
        }
    }
}