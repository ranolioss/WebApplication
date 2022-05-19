<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Course_Selection.aspx.cs" Inherits="UNI.WEB.Course_Selection2" Title="Untitled Page" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>User Profile</h2>
    <table width="100%" style="float:right">
                     <tr>
                        <td><span>StudenT_ID :</span></td><td><asp:Label ID="lblStudentID" runat="server"></asp:Label></td>
                     </tr>
                     <tr>
                        <td><span>Name:</span></td><td><asp:Label ID="lblName" runat="server"></asp:Label></td>
                     </tr>
                     <tr>
                        <td><span>Family_Name:</span></td><td><asp:Label ID="lblFamily" runat="server"></asp:Label></td>
                     </tr>
                     <tr>
                        <td><span>Course_Name:</span></td><td><asp:Label ID="lblCourse_Name" runat="server" /></td>
                     </tr>
                     <tr>
                        <td><span>User_ID:</span></td><td><asp:Label ID="lblIdnumber" runat="server"></asp:Label></td>
                     </tr>
                     <tr>
                        <td><span>Start_Year:</span></td><td><asp:Label ID="lblStartYear" runat="server"></asp:Label></td>
                     </tr>                     
                </table>
                <br />
                <hr />
                <h2>Selected_Course</h2>
                <asp:GridView ID="grdSelectedCourse"
                              DataKeyNames="GoursCourse_Cod"
                              SelectedRowStyle-ackColor="Beige" 
                              OnRowCommand="btnDelete_Click"                              
                              style="width:100%;" runat="server" 
        onrowdeleting="grdSelectedCourse_RowDeleting">
                <Columns>
                <asp:ButtonField Text="Delet" CommandName="Delete"/>                
                </Columns>
                    <SelectedRowStyle BackColor="White" />
                    <HeaderStyle BackColor="#CCCCCC" />
                </asp:GridView>
                <br />
                <hr />
                <h2>List_Course</h2>    
                <asp:GridView ID="grdCourseList" 
                              DataKeyNames="GoursCourse_Cod"
                              SelectedRowStyle-BackColor="Beige" 
                              OnRowCommand="btnSelect_Click"                              
                              onrowdeleting="grdCourseList_RowDeleting"
                              style="width:100%;" runat="server" >
                <Columns>
                    <asp:ButtonField Text="Select" CommandName="Delete"/>                
                </Columns>

<SelectedRowStyle BackColor="White"></SelectedRowStyle>
                    <HeaderStyle BackColor="#CCCCCC" />
                </asp:GridView>
           </asp:Content>
           <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
                <asp:Button ID="btnShowResult" CssClass="btn" style="width:100%;" 
                    Text="Results" runat="server" 
                    onclick="btnShowResults_Click1"  />
                <br />
                <asp:Button ID="btnShowAllResults" CssClass="btn" style="width:100%;" Text="AllSemester_Certificate" runat="server" />
                <br />
                <asp:Button ID="btnSelect_Course" CssClass="btn" style="width:100%;" 
                    Text="Select_Course" runat="server"  />
           </asp:Content>
