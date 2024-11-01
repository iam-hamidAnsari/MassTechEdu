using Razorpay.Api;
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
    public partial class ViewCourse : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            string email = "ah91373244@gmail.com";
            Session["email"] = email;

            int id = int.Parse(Session["c_id"].ToString());
            ShowSubCourse(id);
            courseDet(id);
            totalprice(id);
        }

        public void ShowSubCourse(int id)
        { 
            string q = $"  Select sc.name,sc.img,sc.price from  SubCourses sc  where course_id ={id}";
            SqlDataAdapter ada = new SqlDataAdapter(q,conn);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        public void courseDet(int id)
        {
            string q = $" select c_name,c_img,c_desc from Courses where id = {id}";
            SqlCommand cmd = new SqlCommand(q,conn);
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            Label1.Text = rd["c_name"].ToString();
            Image1.ImageUrl = rd["c_img"].ToString();
            LabelDescription.Text = rd["c_desc"].ToString();
            rd.Close();
        }

        public void totalprice(int id)
        {
            string q = $"select sum(price) as totalprice from SubCourses where course_id={id}";
            SqlCommand cmd = new SqlCommand(q,conn);
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            double totalprice = double.Parse(rd["totalprice"].ToString());
            Session["GTotal"] = totalprice; 
            LabelTotalPrice.Text = totalprice.ToString("F2");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["c_id"].ToString());
            string q1 = $" select c_name,c_img,c_desc from Courses where id = {id}";
            SqlCommand cmd = new SqlCommand(q1, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            string name = rd["c_name"].ToString();
            string img = rd["c_img"].ToString();
            rd.Close();
            string q = $"insert into checkout values('{Session["email"].ToString()}','{name}','{img}',{double.Parse(Session["GTotal"].ToString())})";
            cmd = new SqlCommand(q,conn);
            cmd.ExecuteNonQuery();
            Response.Redirect("payment.aspx");
        }
    }
}