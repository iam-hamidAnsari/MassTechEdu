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
    public partial class cart : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                bindGv();   
            }
            try
            {
                Label4.Text = sumofcart().ToString("F2");
            }
            catch (Exception ex)
            {
                
                Label4.Text = "0";
            }
            
        }

        public double sumofcart()
        {
            string q = $"exec sumofcart '{Session["email"]}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            if (rdr["G_total"].Equals(null))
            { 
                return 0 ;
            }
            return double.Parse(rdr["G_total"].ToString());
        }


        public void bindGv()
        {
            string q = $"exec fetchCart '{Session["email"].ToString()}'";
            SqlDataAdapter ada = new SqlDataAdapter(q,conn);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string q = $"exec deletecartitem {id}";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Remove from your cart !!')</script>");
            bindGv();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string q = $"exec AddtoCheckout '{Session["email"].ToString()}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            cmd.ExecuteNonQuery();
            Response.Redirect("checkout.aspx");
        }
    }
}