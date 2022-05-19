<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="UNI.WEB.Schedule2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>User Profile</h2>
   
    <table width="100%" style="float:right;">
                     <tr>
                        <td><span>Name:</span></td><td><asp:Label ID="lblName" runat="server"></asp:Label></td>
                     </tr>
                     <tr>
                        <td><span>Family_Name:</span></td><td><asp:Label ID="lblFamily" runat="server"></asp:Label></td>
                     </tr>
                     <tr>
                        <td><span>User_ID:</span></td><td><asp:Label ID="lblIdnumber" runat="server"></asp:Label></td>
                     </tr>                     
    </table>
    <br />
    <br /> 
    <hr />
    <h2>Course Schedule</h2>
                <table style="float:right;margin-right:75px;">
                    <tr><td colspan="2"><asp:Label style="color:White;font-size:11px;font-weight:bold;" ID="lblMsg" runat="server" /></td></tr>
                     <tr>
                        <td><span>Semester:</span></td><td><asp:TextBox ID="txtSemester" runat="server" ReadOnly="true" /></td>
                     </tr>
                     <tr>
                        <td><span>Course:</span></td><td><asp:DropDownList ID="drpCourse" Width="100%" runat="server" /></td>
                     </tr>
                     <tr>
                     <td><span>Course_Name:</span></td><td><asp:DropDownList ID="drpCourse_Name" Width="100%" runat="server" /></td>
                     </tr>
                     <tr>
                        <td><span>Prof_Name:</span></td><td><asp:DropDownList ID="drpProfessor" Width="100%" runat="server" /></td>
                     </tr>
                     <tr>
                        <td><span>Week:</span></td><td><asp:DropDownList ID="drpDay" Width="100%" runat="server" >
                        <asp:ListItem>Monday</asp:ListItem>
                        <asp:ListItem>Tuesday</asp:ListItem>
                        <asp:ListItem>Wednesday</asp:ListItem>
                        <asp:ListItem>Thursday</asp:ListItem>
                        <asp:ListItem>Friday</asp:ListItem>
                        </asp:DropDownList>
                        </td>
                     </tr>                                          
                     <tr>
                        <td><span>Time:</span></td><td><asp:DropDownList ID="drpTime" Width="100%" runat="server" >
                        <asp:ListItem>8-10</asp:ListItem>
                        <asp:ListItem>10-12</asp:ListItem>
                        <asp:ListItem>12-2</asp:ListItem>
                        <asp:ListItem>2-4</asp:ListItem>
                        <asp:ListItem>4-6</asp:ListItem>
                        </asp:DropDownList>
                        </td>
                     </tr>
                     <tr>
                        <td></td><td><asp:Button ID="btnSubmit" style="float:left;" 
                             ValidationGroup="Register" CssClass="btn" Text="Register" runat="server" 
                             onclick="btnSubmit_Click"/></td>
                     </tr>
                </table>                             
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Button ID="btnSchedule" CssClass="btn" style="width:100%;" 
        Text="Schedule" runat="server" 
        onclick="btnSchedule_Click" />
    <br />
    <asp:Button ID="btnEnterGrade" CssClass="btn" style="width:100%;" 
        Text="Enter_Grade" runat="server" onclick="btnEnterGrade_Click" />
</asp:Content>