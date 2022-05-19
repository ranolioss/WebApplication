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
    public partial class Grade_Certificate : System.Web.UI.Page
    {
        //SqlConnection Cn = new SqlConnection(Connection.ConnectionString);
         SqlConnection con = new SqlConnection(@"Data Source=.\MSQLSERVICRANA;database=UNI;Integrated Security=True;");
        SqlDataAdapter Ad;
        DataTable Table;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Checking Session variable is not empty  
            if (Session["Name"] != null && Session["Family"] != null)
            {
                // Displaying stored all
                lblName.Text = Session["Name"].ToString();
                lblFamily.Text = Session["Family"].ToString();
                lblIdnumber.Text = Session["Sh-Sh"].ToString();
                lblStartYear.Text = Session["Startyear"].ToString();
                lblCourse_Name.Text = Session["Reshte"].ToString();
                lblStudentID.Text = Session["StudentID"].ToString();
                //fill data from database
                Ad = new SqlDataAdapter("select TermID from TBLTerm where IsCurrent=1", con);
                Table = new DataTable();
                Ad.Fill(Table);
                string CurrentTerm = Table.Rows[Table.Rows.Count - 1][0].ToString();
                Ad = new SqlDataAdapter("SELECT  dbo.TBLCoursegroup.CoursegroupID,TBLCourse.Name ,dbo.TBLGrade.Score" +
                                                       " FROM    dbo.TBLStudent INNER JOIN" +
                                                               " dbo.TBLGrade ON dbo.TBLStudent.StudentID = dbo.TBLGrade.StudentID INNER JOIN" +
                                                               " dbo.TBLCoursegroup ON dbo.TBLGrade.CoursegroupID = dbo.TBLCoursegroup.CoursegroupID INNER JOIN" +
                                                               " dbo.TBLCourse ON dbo.TBLCourse.CourseID = dbo.TBLCoursegroup.CourseID" +
                                                               " where TBLStudent.StudentID=" + lblStudentID.Text, con);
                Table = new DataTable();
                Ad.Fill(Table);
                GridScore.DataSource = Table;
                GridScore.DataBind();
            }
            //Redirectig page Default
            else { Response.Redirect("Default.aspx"); }
        }
        protected void btnSelect_Course_Click(object sender, EventArgs e)
        {
            //Redirectig page Default
            Response.Redirect("Course_Selection.aspx");
        }

        protected void btnShowAllResults_Click(object sender, EventArgs e)
        {

        }
    }
}