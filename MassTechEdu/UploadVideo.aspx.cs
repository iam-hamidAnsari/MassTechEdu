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
    public partial class UploadVideo : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                fillDropdown1();

            }
        }
        public void fillDropdown1()
        {
            String q = "select id,c_name from Courses";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DropDownList1.DataSource = rdr;
            DropDownList1.DataTextField = "c_name";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();
            rdr.Close();
            fillDropdown2();

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillDropdown2();
        }

        public void fillDropdown2()
        {
            string courseId = DropDownList1.SelectedValue;
            //String q = $"select id,name from SubCourses where course_id= {courseId}";
            string q = $"exec GetSubCoursesByCourseId '{courseId}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DropDownList2.DataSource = rdr;
            DropDownList2.DataTextField = "name";
            DropDownList2.DataValueField = "id";
            DropDownList2.DataBind();
            rdr.Close();

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string title = TextBox1.Text;
            string ImageURL = TextBox2.Text;
            string SubCourseId = DropDownList2.SelectedValue;
            string q = $"exec AddVideo '{SubCourseId}','{ImageURL}','{title}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Video added successfully')</script>");

        }
    }
}