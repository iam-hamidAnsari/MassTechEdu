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
    public partial class AddSubCourse : System.Web.UI.Page
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
            // String q = "select id,c_name from Courses";
            string q = $"exec GetCourses";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DropDownList1.DataSource = rdr;
            DropDownList1.DataTextField = "c_name";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();
            rdr.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string SelectedCourseId = DropDownList1.SelectedValue;
            string SubCourseName = TextBox1.Text;
            string SubCourseImage = FileUpload1.FileName;
            Decimal Price = Decimal.Parse(TextBox2.Text);
            if (FileUpload1.HasFile)
            {
                SubCourseImage = "SubCourseImg/" + FileUpload1.FileName;
                string filePath = Server.MapPath("SubCourseImg/") + FileUpload1.FileName;
                FileUpload1.SaveAs(filePath);
            }

            string q = $"exec AddSubCourse '{SelectedCourseId}','{SubCourseName}','{SubCourseImage}','{Price}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('SubCourse added successfully')</script>");

        }
    }
}