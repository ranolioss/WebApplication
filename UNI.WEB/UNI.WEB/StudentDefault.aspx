<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="StudentDefault.aspx.cs" Inherits="UNI.WEB.StudentDefault2"  Title="Untitled Page" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>User Profile</h2>
    <br />
    <table width="100%" style="float:right">
                     <tr>
                        <td><span>Student_ID :</span></td><td><asp:Label ID="lblStudentID" runat="server"></asp:Label></td>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Button ID="btnResults" CssClass="btn" style="width:100%;" 
        Text=" Grade " runat="server" onclick="btnResults_Click" />
                <br />
                <asp:Button ID="btnShowAllResults" CssClass="btn" style="width:100%;" Text="AllSemester_Certificate" runat="server" />
                <br />
                <asp:Button ID="btnSelect_Course" CssClass="btn" style="width:100%;" 
                    Text="Select_Course" runat="server" onclick="btnSelect_Course_Click" />
</asp:Content>

