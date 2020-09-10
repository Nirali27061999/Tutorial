<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demostate.aspx.cs" Inherits="demostate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    
     <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" />

    <link href="Bootstrap/css/bootstrap-grid.css" rel="stylesheet" />
    <link href="Bootstrap/css/bootstrap-grid.min.css" rel="stylesheet" />
    <script src="Bootstrap/js/bootstrap.js"></script>
     <link rel="stylesheet" href="design.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   <div class="text-center" style="margin-top: 30px;">
            <h2 class="text-danger">MAS Finicial LTD.</h2>
        </div>
           
        <div class="text-dark text-center" style="margin-top: 30px;">
            <h2 class="text-capitalize text-info">State Registration Form</h2>
            <hr />
        </div>
        
       
        <div class="form-group">
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </div>
        <div class="flex">
            <div style="margin-left:0px;">
               <strong>  State:<span class="text-danger">*</span></strong>
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="margin-right:4px;">
                <asp:TextBox ID="txtstatename" runat="server" CssClass="form-control" Width="200px" MaxLength="20" placeholder="State Name*"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqstatename" runat="server" ControlToValidate="txtstatename" Display="Dynamic" ErrorMessage="Please Fill State name" ForeColor="#ff0000"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="ragstatename" runat="server"  ControlToValidate="txtstatename" Display="Dynamic" ErrorMessage="Please enter only alphabets" ValidationExpression="[a-zA-Z ]*$" ForeColor="#ff0000"></asp:RegularExpressionValidator>
            </div>
        </div>
        <br />
        <div class="flex rd">
            <div style="margin-left:30px;">
                <strong>  IsActive?:<span class="text-danger">*</span></strong>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div style="margin-right:4px;" >
                <asp:RadioButton ID="rbyes" runat="server" Text="Yes" Checked="true" GroupName="active"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rbno" runat="server" Text="No" GroupName="active" />
            </div>
        </div>
           
        <br />
        <div class="form-group text-center">
            <asp:Button ID="btnsbt" runat="server" Text="Submit"   CssClass="btn btn-primary" />
            <asp:Button ID="btnclear" runat="server" Text="Clear"   CssClass="btn btn-danger" />
        </div>
            
       

    
    
    </form>
</body>
</html>
