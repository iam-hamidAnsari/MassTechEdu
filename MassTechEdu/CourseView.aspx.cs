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
    public partial class CourseView : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            int id = int.Parse(Session["c_id"].ToString());
            ShowSubCourse(id);
            courseDet(id);
            LabelTotalPrice.Text = totalprice(id).ToString("F2"); 
        }

        public void ShowSubCourse(int id)
        {
            string q = $" exec fetchSubCourse {id}";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        public void courseDet(int id)
        {
            string q = $"exec fetchcoursebyId {id}";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            Label1.Text = rd["c_name"].ToString();
            Image1.ImageUrl = rd["c_img"].ToString();
            LabelDescription.Text = rd["c_desc"].ToString();
            rd.Close();
        }

        public double totalprice(int id)
        {
            string q = $"exec courseprice {id}";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            double totalprice = double.Parse(rd["totalprice"].ToString());
            return totalprice;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            int id = int.Parse(Session["c_id"].ToString());
            double price = totalprice(id);
            string q = $"exec addtocart '{Session["email"].ToString()}',{price},{id}";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Redirect("cart.aspx");
        }
    }
}