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
    public partial class UserOurCourse : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                ShowCourses();

            }
        }

        public void ShowCourses()
        {
            string q = "exec showourcourses";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected string GetRatingStars(object rating)
        {
            if (rating != DBNull.Value)
            {
                int starCount = Convert.ToInt32(rating);
                return new string('★', starCount) + new string('☆', 5 - starCount); // Display filled and empty stars
            }
            return "No ratings yet";
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("ViewCourse"))
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["c_id"] = id;
                Response.Redirect("CourseView.aspx");
            }
        }
    }
}