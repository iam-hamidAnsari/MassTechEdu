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
    public partial class Watchsubcourse : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                int id =int.Parse(Session["c_id"].ToString());
                watchsubcourse(id);
            }
        }

        public void watchsubcourse(int id)
        {
            string q = $"  Select id,name,img from  SubCourses   where course_id ={id}";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("watch"))
            {
                int subcrs_id = int.Parse(e.CommandArgument.ToString());
                Session["subcrs_id"] = subcrs_id;
                Response.Redirect("videos.aspx");
            }
        }


    }
}