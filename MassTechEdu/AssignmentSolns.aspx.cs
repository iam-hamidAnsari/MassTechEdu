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
    public partial class AssignmentSolns : System.Web.UI.Page
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
            bindgv();

        }

        public void bindgv()
        {
            string q = $"exec fetchAssigmentsoln {int.Parse(DropDownList1.SelectedValue)}";
            SqlDataAdapter ada = new SqlDataAdapter (q, conn);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindgv();
        }
    }
}