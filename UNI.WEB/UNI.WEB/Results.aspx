<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="UNI.WEB.Results"  Title="Untitled Page" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Groups List</h2>
        <asp:GridView ID="GridDisplayCourseGroup" runat="server"
                        DataSourceID="DtsDisplay"
                        Width="100%"
                        DataKeyNames="CoursegroupID"
                        AutoGenerateColumns="false"
                        AutoGenerateSelectButton="true">
                        <Columns>
                            <asp:BoundField DataField="CoursegroupID" HeaderText="Course_Group_ID" />
                            <asp:BoundField DataField="CourseName" HeaderText="Course_Name" />
                            <asp:BoundField DataField="TeacherName" HeaderText="Professor" />
                            <asp:BoundField DataField="TermName" HeaderText="Semester" />
                            <asp:BoundField DataField="BranchName" HeaderText="Path" />
                        </Columns>
                        <SelectedRowStyle BackColor="White" />
                        <HeaderStyle BackColor="#CCCCCC" />
              </asp:GridView>
              <br />
              <hr />
              <br />
              <h2>Students List</h2>
              <asp:GridView ID="GridScore"
                            Width="100%"
                            DataSourceID="DtsScore"
                            DataKeyNames="CoursegroupID"
                            AutoGenerateEditButton="True"
                            AutoGenerateColumns="False" runat="server">
              <Columns>
                <asp:BoundField DataField="CoursegroupID" HeaderText="Course_Group_ID" 
                      ReadOnly="True" >
                    <HeaderStyle Width="20px" />
                  </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Course_Name" ReadOnly="True" >                
                    <HeaderStyle Width="30px" />
                  </asp:BoundField>
                <asp:BoundField DataField="StudentID" HeaderText="User_ID" 
                      ReadOnly="True" >
                    <HeaderStyle Width="20px" />
                  </asp:BoundField>
                <asp:BoundField DataField="StudentName" HeaderText="Name And Family Name" 
                      ReadOnly="True" >
                    <HeaderStyle Width="50px" Wrap="True" />
                  </asp:BoundField>
                <asp:BoundField DataField="Score" HeaderText="Result" >
                    <HeaderStyle Width="20px" />
                  </asp:BoundField>
              </Columns>
                  <SelectedRowStyle BackColor="White" />
                  <HeaderStyle BackColor="#CCCCCC" />
              </asp:GridView>
       <asp:SqlDataSource ID="DtsDisplay"  
         runat="server"
        
      connectionstring= "server=.\MSQLSERVICRANA;database=UNI;integrated security=true;"
         SelectCommand="SELECT     dbo.TBLCoursegroup.CoursegroupID , dbo.TBLTeacher.Name + ' ' + dbo.TBLTeacher.Family as[TeacherName], dbo.TBLCourse.Name as[CourseName], 
                                   dbo.TBLTerm.Name as[TermName], dbo.TBLBranch.Name as[BranchName]
                        FROM       dbo.TBLCoursegroup INNER JOIN
                                   dbo.TBLTeacher ON dbo.TBLCoursegroup.TeacherID = dbo.TBLTeacher.TeacherID INNER JOIN
                                   dbo.TBLTerm ON dbo.TBLCoursegroup.TermID = dbo.TBLTerm.TermID INNER JOIN
                                   dbo.TBLCourse ON dbo.TBLCoursegroup.CourseID = dbo.TBLCourse.CourseID INNER JOIN
                                   dbo.TBLBranch ON dbo.TBLCoursegroup.BranchID = dbo.TBLBranch.BranchID">
                      </asp:SqlDataSource>
         
 
         
         <asp:SqlDataSource ID="DtsScore"
                            runat="server"
            
                                    ConnectionString= "server=.\MSQLSERVICRANA;database=UNI;Integrated Security=True;"
                                    SelectCommand="SELECT  dbo.TBLCoursegroup.CoursegroupID,TBLCourse.Name ,dbo.TBLStudent.StudentID , dbo.TBLStudent.Name + dbo.TBLStudent.Family as[StudentName], dbo.TBLGrade.Score
                                                   FROM    dbo.TBLStudent INNER JOIN
                                                           dbo.TBLGrade ON dbo.TBLStudent.StudentID = dbo.TBLGrade.StudentID INNER JOIN
                                                           dbo.TBLCoursegroup ON dbo.TBLGrade.CoursegroupID = dbo.TBLCoursegroup.CoursegroupID INNER JOIN
                                                           dbo.TBLCourse ON dbo.TBLCourse.CourseID = dbo.TBLCoursegroup.CourseID
                                                           where TBLCoursegroup.coursegroupid=@Coursegroupid"
                      
                                    UpdateCommand="update tblgrade set score =@Score where coursegroupid=@CoursegroupID ">
                                      <SelectParameters >
                                        <asp:ControlParameter ControlID="GridDisplayCourseGroup" Name="CoursegroupID" PropertyName="SelectedValue"  />
                                      </SelectParameters>
                      </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Button ID="btnSchedule" CssClass="btn" style="width:100%;" 
        Text="Schedule" runat="server" onclick="btnSchedule_Click" />
    <br />
    <asp:Button ID="btnEnterGrade" CssClass="btn" style="width:100%;" 
        Text="Enter_Grade" runat="server" />                            
</asp:Content>

