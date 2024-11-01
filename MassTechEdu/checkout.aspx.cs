using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Org.BouncyCastle.Bcpg.OpenPgp;

namespace MassTechEdu
{
    public partial class checkout : System.Web.UI.Page
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
                Label3.Text = Gtotal().ToString("F2");
            }
           
        }

        public void bindGV()
        {
            string q = $"exec fetchCheckout '{Session["email"].ToString()}'";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        public void dltcoursefromChkout()
        {
            string q = $"exec clearCheckout '{Session["email"].ToString()}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            cmd.ExecuteNonQuery();
        }

        public double Gtotal()
        {
            string q = $"sumofcheckout '{Session["email"].ToString()}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            if (rdr["G_total"].Equals(null))
            {
                return 0;
            }
            return double.Parse(rdr["G_total"].ToString());
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string keyId = "rzp_test_Kl7588Yie2yJTV";
            string keySecret = "6dN9Nqs7M6HPFMlL45AhaTgp";

            RazorpayClient razorpayClient = new RazorpayClient(keyId, keySecret);

            double amount = Gtotal();
            Session["GTotal"] = amount;


            // Create an order
            Dictionary<string, object> options = new Dictionary<string, object>();
            options.Add("amount", amount * 100); // Amount should be in paisa (multiply by 100 for rupees)
            options.Add("currency", "INR");
            options.Add("receipt", "order_receipt_123");
            options.Add("payment_capture", 1); // Auto capture payment

            Razorpay.Api.Order order = razorpayClient.Order.Create(options);

            string orderId = order["id"].ToString();

            // Generate checkout form and redirect user to Razorpay payment page
            string razorpayScript = $@"
                    var options = {{
                        'key': '{keyId}',
                        'amount': {amount * 100},
                        'currency': 'INR',
                        'name': 'Masstech Business Solutions Pvt.Ltd',
                        'description': 'Checkout Payment',
                        'order_id': '{orderId}',
                        'handler': function(response) {{
                            // Handle successful payment response
                           // alert('Payment successful. Payment ID: ' + response.razorpay_payment_id);
                            window.location.href='Invoice.aspx';
                        }},
                        'prefill': {{
                            'name': 'Krish Kheloji',
                            'email': 'khelojikrish@gmail.com',
                            'contact': '7208921898'
                        }},
                        'theme': {{
                            'color': '#F37254'
                        }}
                    }};
                    var rzp1 = new Razorpay(options);
                    rzp1.open();";

            dltcoursefromChkout();
            // Register the script on the page

            ClientScript.RegisterStartupScript(this.GetType(), "razorpayScript", razorpayScript, true);
            
        }
    }
}