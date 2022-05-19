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
    public partial class ProfessorDefault2 : System.Web.UI.Page
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
            }
            else
            {
                //Redirectig page Default
                Response.Redirect("Default.aspx");
            }
        }
        protected void btnSchedule_Click(object sender, EventArgs e)
        {
            //Redirectig page Schedule
            Response.Redirect("Schedule.aspx");
        }
        protected void btnEnterGrade_Click(object sender, EventArgs e)
        {
            //Redirectig page Results
            Response.Redirect("Results.aspx");
        }
    }
}