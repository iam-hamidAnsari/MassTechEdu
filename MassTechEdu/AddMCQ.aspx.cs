using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MassTechEdu
{
    public partial class AddMCQ : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                fetchCourses();

            }

        }

        public void fetchCourses()
        {
            string q = "exec fetchCourse";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            DropDownList2.DataSource = dt;
            DropDownList2.DataTextField = "c_name";
            DropDownList2.DataValueField = "id";
            DropDownList2.DataBind();
            fetchSubcourse();
        }
        public void fetchSubcourse()
        {
            string q = $"exec fetchSubcourseName {int.Parse(DropDownList2.SelectedValue)}";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "name";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string q = $"exec AddMCQ '{TextBox1.Text}','{TextBox2.Text}','{TextBox3.Text}','{TextBox4.Text}','{TextBox5.Text}','{TextBox6.Text}',{int.Parse(DropDownList1.SelectedValue)}";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('MCQ added Successfully..')</script>");

            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox5.Text = string.Empty;
            TextBox6.Text = string.Empty;
        }
    }
}