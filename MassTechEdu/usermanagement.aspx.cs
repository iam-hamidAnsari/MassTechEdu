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
    public partial class usermanagement : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                bindGV();
            }
        }

        public void bindGV()
        {
            string q = $"exec fetchusers";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View" || e.CommandName == "Update" || e.CommandName == "Delete")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (e.CommandName == "View")
                {
                    Response.Redirect($"viewuser.aspx?id={index}");
                }
                else if (e.CommandName == "Update")
                {
                    Response.Redirect($"Updateprofile.aspx?id={index}");
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string userId = e.Keys["id"].ToString();
            string query = $"delete FROM Users WHERE id = '{userId}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Deleted Successfuly ')</script>");
            bindGV();
        }
    }
}