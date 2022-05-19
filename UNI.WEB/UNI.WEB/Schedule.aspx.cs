using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using UNI.WEB.App_C;

namespace UNI.WEB
{
    public partial class Schedule2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\MSQLSERVICRANA;database=UNI;Integrated Security=True;");
        SqlDataAdapter da;
        DataTable dt;
        string strTermID;
       
        // control data from databases
        void BindTerm()
        {
            //read query
            da = new SqlDataAdapter("select TermID,Name from TBLTerm where IsCurrent=1", con);
            dt = new DataTable();
            da.Fill(dt);
            txtSemester.Text = dt.Rows[0]["Name"].ToString();
            strTermID = dt.Rows[0]["TermID"].ToString();
        }
        void BindReshte()
        {
            da = new SqlDataAdapter("select BranchID,Name from TBLBranch", con);
            dt = new DataTable();
            da.Fill(dt);
            drpCourse_Name.DataSource = dt;
            drpCourse_Name.DataTextField = "Name";
            drpCourse_Name.DataValueField = "BranchID";
            drpCourse_Name.DataBind();
        }

        void BindCourse()
        {
            da = new SqlDataAdapter("select CourseID,Name from TBLCourse", con);
            dt = new DataTable();
            da.Fill(dt);
            drpCourse.DataSource = dt;
            drpCourse.DataTextField = "Name";
            drpCourse.DataValueField = "CourseID";
            drpCourse.DataBind();
        }

        void BindProfessor()
        {
            da = new SqlDataAdapter("select TeacherID,Name from TBLTeacher", con);
            dt = new DataTable();
            da.Fill(dt);
            drpProfessor.DataSource = dt;
            drpProfessor.DataTextField = "Name";
            drpProfessor.DataValueField = "TeacherID";
            drpProfessor.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            BindTerm();
            if (Session["Name"] != null && Session["Family"] != null)
            {
                lblName.Text = Session["Name"].ToString();
                lblFamily.Text = Session["Family"].ToString();
                lblIdnumber.Text = Session["Sh-Sh"].ToString();
                if (!Page.IsPostBack)
                {
                    BindReshte();
                    BindCourse();
                    BindProfessor();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //insert to data
            SqlCommand cmd = new SqlCommand("insert into TBLCoursegroup(BranchID,CourseID,TermID,TeacherID,Day,Time)" +
                                         " VALUES(" + drpCourse_Name.SelectedValue + "," + drpCourse.SelectedValue + "," + strTermID + "," + drpProfessor.SelectedValue + ",N'" + drpDay.SelectedItem.Text + "','" + drpTime.SelectedItem.Text + "')", con);
            con.Open();
            // Call ExecuteNonQuery to send command
            if (cmd.ExecuteNonQuery() > 0)
                lblMsg.Text = "Your Information Submited!";
            else lblMsg.Text = "Please Enter your information again!";
            con.Close();
        }
        protected void btnSchedule_Click(object sender, EventArgs e)
        {
            //Redirectig page Schedule from server aspx
            Response.Redirect("Schedule.aspx");
        }
        protected void btnEnterGrade_Click(object sender, EventArgs e)
        {
            //Redirectig page Grade from server aspx
            Response.Redirect("Grade.aspx");
        }
    }
}