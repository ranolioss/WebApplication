<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UNI.WEB.Default2"  Title="Untitled Page" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Rigester</h2>                
                <br />                
                <table width="100%" style="float:right;">
                    <tr><td colspan="2"><asp:Label style="color:White;font-size:11px;font-weight:bold;" ID="lblMsg" runat="server" /></td></tr>
                     <tr>
                        <td><span>Name:</span></td><td><asp:TextBox ID="txtName" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="rfvName" ValidationGroup="Register" ControlToValidate="txtName" Text="*" runat="server" /></td>
                     </tr>
                     <tr>
                        <td><span>Family_Name:</span></td><td><asp:TextBox ID="txtFamily" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="rfvFamily" ValidationGroup="Register" ControlToValidate="txtFamily" Text="*" runat="server" /></td>
                     </tr>
                     <tr>
                        <td><span>Course_Name:</span></td><td><asp:DropDownList ID="drpCourse_Name" runat="server" /></td>
                     </tr>
                     <tr>
                        <td><span>User_ID:</span></td><td><asp:TextBox ID="txtIdnumber" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="rfvIdnumber" ValidationGroup="Register" ControlToValidate="txtIdnumber" Text="*" runat="server" /></td>
                     </tr>
                     <tr>
                        <td><span>Start_Year:</span></td><td><asp:TextBox ID="txtStartYear" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="rfvStartYear" ValidationGroup="Register" ControlToValidate="txtStartYear" Text="*" runat="server" /></td>
                     </tr>
                     <tr>
                        <td></td><td><asp:Button ID="btnSubmit" style="float:left;" 
                             ValidationGroup="Register" CssClass="btn" Text="Send" runat="server" 
                             onclick="btnSubmit_Click"/></td>
                     </tr>
                </table>
</asp:Content>