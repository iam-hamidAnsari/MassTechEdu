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
    public partial class MyCourse : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                watchCourse();
                otherCourse();
            }
            if (Session.Equals(null))
            {
                Response.Write("<script>alert('You need To Login First!!')</script>");
            }

        }

        public void watchCourse()
        {
            string q = $"exec fetchMycourse '{Session["email"].ToString()}'";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        } 
        
        public void otherCourse()
        {
            string q = $"exec fetchOtherCourses '{Session["email"].ToString()}'";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            DataList2.DataSource = ds;
            DataList2.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("Watch"))
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["c_id"] = id;
                Response.Redirect("MySubCourses.aspx");
            }
        }        

        protected void DataList2_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("Watch"))
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["c_id"] = id;
                Response.Redirect("CourseView.aspx");
            }
        }
    }
}