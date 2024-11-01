using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MassTechEdu
{
    public partial class Reviews : System.Web.UI.Page
    {
        SqlConnection conn; 
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                bindgv();
            }
        }

        public void bindgv()
        {
            string q = "exec bindreview";
            SqlDataAdapter  ada = new SqlDataAdapter(q,conn);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind(); 
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("approve"))
            {
                int id = int.Parse(e.CommandArgument.ToString());

                string q = $"exec approvereview {id}";
                SqlCommand cmd = new SqlCommand(q,conn);  
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Review Approved!!')</script>");
                GridView1.DataBind();
            }
        }
    }
}