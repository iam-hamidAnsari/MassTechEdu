using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Org.BouncyCastle.Utilities.Collections;

namespace MassTechEdu
{
    public partial class WatchVideo : System.Web.UI.Page
    {
        SqlConnection conn;
        int score = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
           
            if (!IsPostBack)
            {
                BindPlaylists();
                LoadQuestions();
                binggv();
            }
        }

        protected void gridPlaylists_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Play")
            {
                int playlistId = Convert.ToInt32(e.CommandArgument);


                string query = $"SELECT video_links FROM Videos WHERE id = {playlistId}";
                SqlCommand command = new SqlCommand(query, conn);



                string yt = command.ExecuteScalar().ToString();
                string iframeUrl = $"https://www.youtube.com/embed/{yt}";


                string iframeHtml = $"<iframe width='800' height='400' src='{iframeUrl}' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>";


                ltrYouTubePlayer.Text = iframeHtml;

            }
        }

        private void BindPlaylists()
        {
            
            int id = int.Parse(Session["subcrs_id"].ToString());
            string query = $"SELECT id, title FROM Videos where sub_course_id ={id} ";
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();


            adapter.Fill(dataTable);

            gridPlaylists.DataSource = dataTable;
            gridPlaylists.DataBind();

        }

        private void LoadQuestions()
        {
            string query = $"exec fetchmcq {int.Parse(Session["subcrs_id"].ToString())}";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            int i = 1;

            MultiView1.ActiveViewIndex = 0;

            while (rdr.Read() && i <= 5)
            {
                var currentView = MultiView1.Views[MultiView1.ActiveViewIndex];

                System.Web.UI.WebControls.Label questionLabel = (System.Web.UI.WebControls.Label)currentView.FindControl("QuestionLabel" + i);
                RadioButtonList optionsList = (RadioButtonList)currentView.FindControl("OptionsList" + i);

                if (questionLabel != null && optionsList != null)
                {
                    questionLabel.Text = rdr["question"].ToString();
                    optionsList.Items.Clear();
                    optionsList.Items.Add(new ListItem(rdr["op1"].ToString(), rdr["op1"].ToString()));
                    optionsList.Items.Add(new ListItem(rdr["op2"].ToString(), rdr["op2"].ToString()));
                    optionsList.Items.Add(new ListItem(rdr["op3"].ToString(), rdr["op3"].ToString()));
                    optionsList.Items.Add(new ListItem(rdr["op4"].ToString(), rdr["op4"].ToString()));
                }
                else
                {
                    Response.Write("<script>alert('Controls not found in current view')</script>");
                }
                i++;
            }
        }



        public void CheckAnswer(string selectedValue, string correctAnswer, System.Web.UI.WebControls.Label label, string question, int questionIndex)
        {
            if (selectedValue == correctAnswer)
            {
                label.Text = $"Q{questionIndex + 1}: Correct!";
                score++;
            }
            else
            {
                label.Text = $"Q{questionIndex + 1}: Incorrect! Correct answer: '{correctAnswer}'. Question: '{question}'"; // Improved clarity
            }
        }

        protected void Button_Next_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int currentViewIndex = Convert.ToInt32(btn.ID.Replace("Button", "").Split('_')[0]) - 1;

            if (currentViewIndex < MultiView1.Views.Count - 1)
            {
                MultiView1.ActiveViewIndex = currentViewIndex + 1;
            }
        }

        protected void Button_Previous_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int currentViewIndex = Convert.ToInt32(btn.ID.Replace("Button", "").Split('_')[0]) - 1;

            if (currentViewIndex > 0)
            {
                MultiView1.ActiveViewIndex = currentViewIndex - 1;
            }
        }

        protected void Button_Submit_Click(object sender, EventArgs e)
        {
            score = 0;
            List<string> correctAnswers = new List<string>();
            List<string> questions = new List<string>();

            string query = $"exec checkans {int.Parse(Session["subcrs_id"].ToString())}";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                questions.Add(reader["question"].ToString());
                correctAnswers.Add(reader["crrt_ans"].ToString());
            }




            CheckAnswer(OptionsList1.SelectedValue, correctAnswers[0], Label1, questions[0], 0);
            CheckAnswer(OptionsList2.SelectedValue, correctAnswers[1], Label2, questions[1], 1);
            CheckAnswer(OptionsList3.SelectedValue, correctAnswers[2], Label3, questions[2], 2);
            CheckAnswer(OptionsList4.SelectedValue, correctAnswers[3], Label4, questions[3], 3);
            CheckAnswer(OptionsList5.SelectedValue, correctAnswers[4], Label5, questions[4], 4);

            Label6.Text = $"Your Score: {score}/5";
            MultiView1.ActiveViewIndex = 5;
        }

        public void binggv()
        {
            string q = $"exec fetchAssignment {int.Parse(Session["subcrs_id"].ToString())}";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        public void uploadassignment(int id, string assignmentpath)
        {
            string q = $"exec uploadAssignment '{Session["email"].ToString()}',{id},'{assignmentpath}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("UploadSoln"))
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                Button uploadbtn = (Button)row.FindControl("Button1");


                // Find the FileUpload control within the GridViewRow
                FileUpload fileUploadControl = (FileUpload)row.FindControl("FileUpload1");
                int id = int.Parse(e.CommandArgument.ToString());
                if (fileUploadControl.HasFile)
                {
                    fileUploadControl.SaveAs(Server.MapPath("Assignment") + Path.GetFileName(fileUploadControl.FileName));
                    string filepath = "Assignment" + Path.GetFileName(fileUploadControl.FileName);
                    uploadassignment(id, filepath);
                    uploadbtn.Visible = false;
                    Response.Write("<script>alert('Assignment Sumbitted!!')</script>");

                }
                else
                {
                    Response.Write("<script>alert('Atach soln File first !!')</script>");
                }

            }
        }

        protected void btnSubmitReview_Click(object sender, EventArgs e)
        {
            string q = $"exec addreview {int.Parse(Session["c_id"].ToString())},'{Session["email"].ToString()}','{txtReviewText.Text}',{int.Parse(rblRating.SelectedValue)}";
            SqlCommand cmd = new SqlCommand(q, conn);
            int result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                //lblMessage.Text = "Review submitted successfully!";
                Response.Write("<script>alert('Review submitted successfully!')</script>");
            }
            else
            {
                lblMessage.Text = "Error submitting review.";
            }
        }
    }
}