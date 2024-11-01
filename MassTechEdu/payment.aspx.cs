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
    public partial class payment : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            bindGV();
        }

        public void bindGV()
        {
            string q = $"select * from checkout where uemail = '{Session["email"].ToString()}'";
            SqlDataAdapter ada = new SqlDataAdapter(q,conn);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string keyId = "rzp_test_Kl7588Yie2yJTV";
            string keySecret = "6dN9Nqs7M6HPFMlL45AhaTgp";

            RazorpayClient razorpayClient = new RazorpayClient(keyId, keySecret);

            double amount = double.Parse(Session["GTotal"].ToString());


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
                            alert('Payment successful. Payment ID: ' + response.razorpay_payment_id);
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

            // Register the script on the page

            ClientScript.RegisterStartupScript(this.GetType(), "razorpayScript", razorpayScript, true);
        }
    }
}