using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MassTechEdu
{
    public partial class UpdateCourse : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                fillDropdown();
            }
        }
        public void fillDropdown()
        {
            
            string q = $"exec GetCourseNames";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DropDownList1.DataSource = rdr;
            DropDownList1.DataTextField = "c_name";
            DropDownList1.DataValueField = "c_name";
            DropDownList1.DataBind();
            rdr.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string oldCourseName = DropDownList1.SelectedValue;
            string newCourseName = TextBox1.Text;
            string newCourseImage = FileUpload1.FileName;
            string newCourseDescription = TextBox2.Text;
            if (FileUpload1.HasFile)
            {
                newCourseImage = "CourseImage/" + FileUpload1.FileName;
                string filePath = Server.MapPath("CourseImage/") + FileUpload1.FileName;
                FileUpload1.SaveAs(filePath); //saving file 
            }

            string q2 = $"exec UpdateCourse '{oldCourseName}','{newCourseName}','{newCourseImage}','{newCourseDescription}'";
            SqlCommand cmd2 = new SqlCommand(q2, conn);
            cmd2.ExecuteNonQuery();
            Response.Write("<script>alert('Course updated successfully')</script>");

        }
    }
}