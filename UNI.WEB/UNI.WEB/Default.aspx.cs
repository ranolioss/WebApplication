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
using System.Globalization;
using UNI.WEB.App_C;

namespace UNI.WEB
{
    public partial class Default2 : System.Web.UI.Page
    {
       // SqlConnection con = new SqlConnection(Connection.ConnectionString);
         SqlConnection con = new SqlConnection(@"Data Source=.\MSQLSERVICRANA;database=UNI;Integrated Security=True;");
        SqlDataAdapter da;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            // read year 
            txtStartYear.Text =  DateTime.Now.Year.ToString();

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("select BranchID,Name from TBLBranch", con);
            da.Fill(dt);
            drpCourse_Name.DataSource = dt;
            drpCourse_Name.DataTextField = "Name";
            drpCourse_Name.DataValueField = "BranchID";
            drpCourse_Name.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into TBLStudent(Name,Family,[Sh-Sh],Startyear,BranchID)" +
                                         " values('" + txtName.Text + "','" + txtFamily.Text + "','" + txtIdnumber.Text + "','" + txtStartYear.Text + "'," + drpCourse_Name.SelectedValue + ")", con);
            try
            {
                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    lblMsg.Text = "Registration completed successfully!" + "<br/>" + "Please Enter you user_ID" + "<br/>" + "Please Enter your Password. ";
                }
            }
            catch { }
            finally { con.Close(); }
        }

    }
}