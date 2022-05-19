using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using UNI.WEB.App_C;

namespace UNI.WEB
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
       //SqlConnection con = new SqlConnection(Connection.ConnectionString);
        SqlConnection con = new SqlConnection(@"Data Source=.\MSQLSERVICRANA;database=UNI;Integrated Security=True;");
        SqlDataAdapter da;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Checking Session variable is not empty  
            if (Session["Name"] != null && Session["Family"] != null)
            {
                // Displaying stored 
                lblOnUser.Text = Session["Name"].ToString() + " " + Session["Family"].ToString() + " " + "Welcome.";
                btnExit.Visible = true;
            }
            else
            {
                lblOnUser.Text = "Welcome To University.";
                // Response.Redirect("Default.aspx");
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //checked radiobottom
            if (rdbStudent.Checked)
            {
                da = new SqlDataAdapter("SELECT     dbo.TBLStudent.StudentID, dbo.TBLStudent.Name, dbo.TBLStudent.Family, dbo.TBLStudent.[Sh-Sh], dbo.TBLStudent.Startyear, " +
                                                                 "dbo.TBLBranch.Name AS Reshte" +
                                                     " FROM         dbo.TBLBranch INNER JOIN" +
                                                     " dbo.TBLStudent ON dbo.TBLBranch.BranchID = dbo.TBLStudent.BranchID where StudentID=" + txtUser_ID.Text + " and [Sh-Sh]='" + txtPassword.Text + "'", con);
                dt = new DataTable();
                try
                {
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        // Displaying stored all
                        Session["Name"] = dt.Rows[0]["Name"].ToString();
                        Session["Family"] = dt.Rows[0]["Family"].ToString();
                        Session["Sh-Sh"] = dt.Rows[0]["Sh-Sh"].ToString();
                        Session["Startyear"] = dt.Rows[0]["Startyear"].ToString();
                        Session["Reshte"] = dt.Rows[0]["Reshte"].ToString();
                        Session["StudentID"] = dt.Rows[0]["StudentID"].ToString();
                        Response.Redirect("StudentDefault.aspx");
                    }
                }
                catch { }
                finally { }
            }
            else
            {
                da = new SqlDataAdapter("select * from TBLTeacher where TeacherID=" + txtUser_ID.Text + " and [Sh-Sh]='" + txtPassword.Text + "'", con);
                dt = new DataTable();
                try
                {
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        // Displaying stored all
                        Session["Name"] = dt.Rows[0]["Name"].ToString();
                        Session["Family"] = dt.Rows[0]["Family"].ToString();
                        Session["Sh-Sh"] = dt.Rows[0]["Sh-Sh"].ToString();
                        Response.Redirect("ProfessorDefault.aspx");
                    }
                }
                catch
                {

                }

            }
        }
        protected void btnExit_Click(object sender, EventArgs e)
        {
            //check session is null
            Session["Name"] = null;
            Session["Family"] = null;
            Session["Sh-Sh"] = null;
            Session["Startyear"] = null;
            Session["StudentID"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}
