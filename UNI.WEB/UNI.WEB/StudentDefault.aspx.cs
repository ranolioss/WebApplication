using System;
using System.Collections;
using System.Configuration;
using System.Data;
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
    public partial class StudentDefault2 : System.Web.UI.Page
    {
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
            }
            else
            {
                //Redirectig page Default
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnSelect_Course_Click(object sender, EventArgs e)
        {
            // Storing all to Session variable  
            Session["Name"] = lblName.Text;
            Session["Family"] = lblFamily.Text;
            Session["Sh-Sh"] = lblIdnumber.Text;
            Session["Startyear"] = lblStartYear.Text;
            Session["Reshte"] = lblCourse_Name.Text;
            Session["StudentID"] = lblStudentID.Text;
            Response.Redirect("Course_Selection.aspx");
        }
        protected void btnResults_Click(object sender, EventArgs e)
        {
            //Redirectig page Grade_Certificate from server aspx
            Response.Redirect("Grade_Certificate.aspx");
        }
    }
}
