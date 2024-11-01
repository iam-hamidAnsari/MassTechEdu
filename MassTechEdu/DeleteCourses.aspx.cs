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
    public partial class DeleteCourses : System.Web.UI.Page
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
            //String q = "select c_name from Courses";
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
            string selectedCourseName = DropDownList1.SelectedValue;
            string q = $"exec DeleteCourse'{selectedCourseName}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Course Permanetantly deleted ')</script>");
        }
    }
}