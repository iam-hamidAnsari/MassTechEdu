using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Configuration;
using iTextSharp.text.pdf;
using iTextSharp.text;
using iTextSharp.tool.xml;

namespace MassTechEdu
{
    public partial class Invoice : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            Label2.Text = Session["GTotal"].ToString();
            geninvoice();
            addCourse();

            string loginPageUrl = ResolveUrl("~/loginPage.aspx");
            string script = $@"
        setTimeout(function() {{
            window.location.href = '{loginPageUrl}';
        }}, 5000);";

            ScriptManager.RegisterStartupScript(this, GetType(), "RedirectAfterDownload", script, true);
        }

        public void addCourse()
        {
            string q = $"exec AddCoursetoUserAcct '{Session["email"].ToString()}','{DateTime.Now.AddDays(30).ToString("dd-MM-yyyy")}','{DateTime.Now.ToString("dd-MM-yyyy")}', {Session["c_id"].ToString()}";
            SqlCommand cmd = new SqlCommand(q,conn);
            cmd.ExecuteNonQuery();
        }

        public  string invoiceno()
        { 
            Random r = new Random();
            return r.Next(19999, 2000000).ToString();   
        }

        public void geninvoice()
        {
            string email = Session["email"].ToString();
            string q = $"exec fetchnameNo '{email}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            string name = rdr["name"].ToString();
            string contact_no = rdr["contact_no"].ToString();
            rdr.Close();

            int cid = int.Parse(Session["c_id"].ToString());
            string q1 = $"exec fetchcoursebyId {cid}";
            SqlCommand cmd1 = new SqlCommand(q1, conn);
            SqlDataReader rdr1 = cmd1.ExecuteReader();
            rdr1.Read();
            string cname = rdr1["c_name"].ToString();
            rdr1.Close();

            string invoice_no = invoiceno();

            string s = @"
                               <style>
             body {
               font-family: Arial, sans-serif;
               background-color: #f4f4f4;
               padding: 20px;
             }

             .invoice {
               background-color: #fff;
               border-radius: 8px;
               box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
               padding: 30px;
               max-width: 600px;
               margin: 0 auto;
             }

             .invoice-header {
               border-bottom: 2px solid #f1f1f1;
               padding-bottom: 20px;
               margin-bottom: 20px;
               text-align: center;
             }

             .invoice-header h1 {
               font-size: 32px;
               margin: 0;
               color: #333;
             }

             .invoice-info {
               display: flex;
               justify-content: space-between;
               margin-bottom: 15px;
             }

             .invoice-info p {
               margin: 5px 0;
               color: #555;
             }

             .invoice-table {
               width: 100%;
               border-collapse: collapse;
               margin-bottom: 20px;
             }

             .invoice-table th, .invoice-table td {
               padding: 12px;
               border-bottom: 1px solid #f1f1f1;
               text-align: left;
             }

             .invoice-table th {
               background-color: #f1f1f1;
               color: #333;
               font-weight: bold;
             }

             .invoice-table td {
               color: #666;
             }

             .invoice-total {
               display: flex;
               justify-content: space-between;
               font-weight: bold;
               font-size: 18px;
               margin-top: 10px;
             }

             .footer {
               margin-top: 20px;
               text-align: center;
               color: #888;
               font-size: 14px;
             }
            </style>

            <body>
             <div class='invoice'>
               <div class='invoice-header'>
                 <h1>Invoice</h1>
               </div>
               <div class='invoice-info'>
                 <p><strong>Invoice Number:</strong> INV-00" + $"{invoice_no}" + @"</p>
                 <p><strong>Name:</strong> " + $"{name}" + @"</p>
                 <p><strong>Date:</strong> " + $"{DateTime.Now.ToString("dd-MM-yyyy")}" + @"</p>
               </div>
               <div class='invoice-info'>
                 <p><strong>Email ID:</strong> " + $"{email}" + @"</p>
                 <p><strong>Contact No:</strong> " + $"{contact_no}" + @"</p>
               </div>
               <table class='invoice-table'>
                 <thead>
                   <tr>
                     <th>Course</th>
                     <th>Total Amount</th>
                     <th>Paid Amount</th>
                     <th>Expiry Date</th>
                   </tr>
                 </thead>
                 <tbody>
                   <tr>
                     <td>" + $"{cname}" + @"</td>
                     <td>" + $"{Session["GTotal"].ToString()}" + @"</td>
                     <td>" + $"{Session["GTotal"].ToString()}" + @"</td> 
                     <td>" + $"{DateTime.Now.AddDays(30).ToString("dd-MM-yyyy")}" + @"</td>
                   </tr>
                 </tbody>
               </table>

               <div class='invoice-total'>
                 <p><strong>Total Paid Amount:</strong></p>
                 <p>" + $"{Session["GTotal"].ToString()}" + @"</p>
               </div>
               <div class='footer'>
                 Thank you for your business!
               </div>
             </div>
            </body>";

            string filename = $"{email}_invoice.pdf";
            GeneratePdfFromHtml(s,filename);
            SendEmailWithAttachment(filename);
        }

        private string GeneratePdfFromHtml(string htmlContent,string fileName)
        {
            string outputPath = Server.MapPath("~/invoice/");
            string filePath = Path.Combine(outputPath, fileName);
            using (FileStream fileStream = new FileStream(filePath, FileMode.Create, FileAccess.Write, FileShare.None))
            {
                Document document = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
                PdfWriter writer = PdfWriter.GetInstance(document, fileStream);
                document.Open();

                using (StringReader stringReader = new StringReader(htmlContent))
                {
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, document, stringReader);
                }

                document.Close(); 
            }
            return filePath;
        }


        private void SendEmailWithAttachment(string filename)
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("mpoke1928@gmail.com");
            mailMessage.To.Add(Session["email"].ToString());
            mailMessage.Subject = "Invoice";
            mailMessage.Body = "Please find the Invoice attachment.";
            mailMessage.IsBodyHtml = true;

            string outputPath = Server.MapPath("~/invoice/");
            string filePath = Path.Combine(outputPath, filename);
            Attachment attachment = new Attachment(filePath);
            attachment.Name = filename; 
            mailMessage.Attachments.Add(attachment);

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new NetworkCredential("mpoke1928@gmail.com", "dhfx widi jvps itnr");
            smtpClient.EnableSsl = true;

            try
            {
                smtpClient.Send(mailMessage);
                Response.Write("<script>alert('Receipt Send Successfully');</script>");
            }
            catch (Exception ex)
            {
                // Handle exception
                throw ex;
            }
            finally
            {
               
                mailMessage.Dispose();
                smtpClient.Dispose();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("LoginPage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/invoice/");
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", $"attachment; filename={Session["email"].ToString()}_invoice.pdf");
            Response.TransmitFile(filePath);
            Response.End();
        }
    }
}