<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ProfessorDefault.aspx.cs" Inherits="UNI.WEB.ProfessorDefault2" Title="Untitled Page"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h2>User Profile</h2>
    <br />
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
    <div style="height:50px;"></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Button ID="btnSchedule" CssClass="btn" style="width:100%;" 
        Text="Planning current semester courses" runat="server" onclick="btnSchedule_Click" />
    <br />
    <asp:Button ID="btnEnterGrade" CssClass="btn" style="width:100%;" 
    Text="Enter_Grade" runat="server" onclick="btnEnterGrade_Click" />                            
</asp:Content>
