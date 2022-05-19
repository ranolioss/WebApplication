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
    public partial class Course_Selection2 : System.Web.UI.Page
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
                //read data from database
                Ad = new SqlDataAdapter("select TermID from TBLTerm where IsCurrent=1", con);
                Table = new DataTable();
                Ad.Fill(Table);
                string CurrentTerm = Table.Rows[Table.Rows.Count - 1][0].ToString();
                Ad = new SqlDataAdapter("SELECT   dbo.TBLCoursegroup.CoursegroupID as[GoursCourse_Cod], dbo.TBLCourse.Name As[Course_Name], dbo.TBLCourse.Unitcount as[ECTS], dbo.TBLTeacher.Name + dbo.TBLTeacher.Family AS [Teacher_Family],dbo.TBLCoursegroup.Day+' '+dbo.TBLCoursegroup.Time as Time " +
                                         " FROM         dbo.TBLCourse INNER JOIN" +
                                                      " dbo.TBLCoursegroup ON dbo.TBLCourse.CourseID = dbo.TBLCoursegroup.CourseID INNER JOIN" +
                                                      " dbo.TBLTeacher ON dbo.TBLCoursegroup.TeacherID = dbo.TBLTeacher.TeacherID INNER JOIN" +
                                                      " dbo.TBLBranch ON dbo.TBLCoursegroup.BranchID = dbo.TBLBranch.BranchID" +
                                         " where dbo.TBLCoursegroup.TermID=" + CurrentTerm + " and dbo.TBLBranch.Name='" + lblCourse_Name.Text + "' and dbo.TBLCoursegroup.CoursegroupID not in(SELECT   dbo.TBLCoursegroup.CoursegroupID as[CoursegroupID]" +
                                                                                                                                                            " FROM         dbo.TBLCourse INNER JOIN" +
                                                                                                                                                                         " dbo.TBLCoursegroup ON dbo.TBLCourse.CourseID = dbo.TBLCoursegroup.CourseID INNER JOIN " +
                                                                                                                                                                         " dbo.TBLTeacher ON dbo.TBLCoursegroup.TeacherID = dbo.TBLTeacher.TeacherID INNER JOIN " +
                                                                                                                                                                         " dbo.TBLGrade ON dbo.TBLCoursegroup.CoursegroupID = dbo.TBLGrade.CoursegroupID INNER JOIN" +
                                                                                                                                                                         " dbo.TBLBranch ON dbo.TBLCoursegroup.BranchID = dbo.TBLBranch.BranchID" +
                                                                                                                                                             " where dbo.TBLCoursegroup.TermID=" + CurrentTerm + " and dbo.TBLBranch.Name='" + lblCourse_Name.Text + "' and dbo.TBLGrade.StudentID=" + Session["StudentID"] + ")", con);
                Table = new DataTable();
                Ad.Fill(Table);
                grdCourseList.DataSource = Table;
                grdCourseList.DataBind();
                //represents a set of SQL commands and a database connection
                Ad = new SqlDataAdapter("SELECT   dbo.TBLCoursegroup.CoursegroupID as[GoursCourse_Cod], dbo.TBLCourse.Name As[Course_Name], dbo.TBLCourse.Unitcount as[ESTC], dbo.TBLTeacher.Name + dbo.TBLTeacher.Family AS [Teacher_Family],dbo.TBLCoursegroup.Day+' '+dbo.TBLCoursegroup.Time as Time " +
                                        " FROM         dbo.TBLCourse INNER JOIN" +
                                                     " dbo.TBLCoursegroup ON dbo.TBLCourse.CourseID = dbo.TBLCoursegroup.CourseID INNER JOIN " +
                                                     " dbo.TBLTeacher ON dbo.TBLCoursegroup.TeacherID = dbo.TBLTeacher.TeacherID INNER JOIN " +
                                                     " dbo.TBLGrade ON dbo.TBLCoursegroup.CoursegroupID = dbo.TBLGrade.CoursegroupID INNER JOIN" +
                                                     " dbo.TBLBranch ON dbo.TBLCoursegroup.BranchID = dbo.TBLBranch.BranchID" +
                                         " where dbo.TBLCoursegroup.TermID=" + CurrentTerm + " and dbo.TBLBranch.Name='" + lblCourse_Name.Text + "' and dbo.TBLGrade.StudentID=" + Session["StudentID"], con);
                Table = new DataTable();
                Ad.Fill(Table);
                grdSelectedCourse.DataSource = Table;
                grdSelectedCourse.DataBind();
            }
            else
                Response.Redirect("Default.aspx");

        }

        protected void btnDelete_Click(object sender, GridViewCommandEventArgs e)
        {
            //hrough this code, we also receive the passed value and we can perform any operation we want.
            int index = int.Parse((string)e.CommandArgument);
            SqlCommand Cmd = new SqlCommand("delete from TBLGrade where CoursegroupID=" + grdSelectedCourse.DataKeys[index].Value + " and StudentID=" + lblStudentID.Text, con);
            con.Open();
            // Call ExecuteNonQuery to send command
            Cmd.ExecuteNonQuery();
            con.Close();
            Page_Load(null, null);
        }
        protected void grdSelectedCourse_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
        protected void btnSelect_Click(object sender, GridViewCommandEventArgs e)
        {
            int index = int.Parse((string)e.CommandArgument);
            SqlCommand Cmd = new SqlCommand("insert into TBLGrade(CoursegroupID,StudentID) values(" + grdCourseList.DataKeys[index].Value + "," + lblStudentID.Text + ")", con);
           con.Open();
            Cmd.ExecuteNonQuery();
            con.Close();
            Page_Load(null, null);
        }
        protected void grdCourseList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
        protected void btnShowResults_Click(object sender, EventArgs e)
        {

        }
        protected void btnShowResults_Click1(object sender, EventArgs e)
        {
            //Redirectig page Grade_Certificate from server aspx
            Response.Redirect("Grade_Certificate.aspx");
        }
    }
}