<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Branchdetails.aspx.cs" Inherits="WebApplication4.Branchdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="StyleSheet2.css" type="text/css" />
     <script type = "text/javascript">
      function Confirm() {
          var confirm_value = document.createElement("INPUT");
          confirm_value.type = "hidden";
          confirm_value.name = "confirm_value";
          if (confirm("Do you want to change?")) {
              confirm_value.value = "Yes";
          } else {
              confirm_value.value = "No";
          }
          document.forms[0].appendChild(confirm_value);
      }
     </script>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <center>
        <h2 class="text-danger col-lg-4 col-md-10 col-sm-12">MAS Finicial LTD.</h2></center>
       
        <br />
        <br />
        <div>
            <center>
                <div class="text-dark" style="margin-top:50px;">
                <h2 class="text-capitalize text-info">Branch Form</h2><hr />
            </div>
                <div class="row">  
                    <div class="col-lg-3"></div>  
                    <div class="col-lg-6">  
                <div class="form-group">
     <asp:HiddenField ID="HiddenField1" runat="server" />
    </div>
                <div class="form-group">
     <asp:Label ID="lblbmname" runat="server" Text="Branch Name:*" CssClass="col-lg-3 col-md-6 col-sm-12"></asp:Label>
      <asp:TextBox ID="txtbmname" runat="server" CssClass=" col-lg-3 col-md-6 col-sm-12" Width="200px"  MaxLength="20" placeholder="Branch Name*"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqbmname" runat="server" ControlToValidate="txtbmname" ErrorMessage="Please Fill Branch name" ForeColor="#ff0000"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="ragbmname" runat="server"  ControlToValidate="txtbmname" ErrorMessage="Please enter only alphabets" ValidationExpression="[a-zA-Z ]*$" ForeColor="#ff0000"></asp:RegularExpressionValidator>
    </div>
    <div class="form-group">
       <asp:Label ID="lblisactive" runat="server" Text="Is active?:*" CssClass="col-lg-3 col-md-6 col-sm-12" ></asp:Label>
      <asp:RadioButton ID="rbyes" runat="server" Text="Yes" Checked="true" GroupName="active" CssClass="custom-radio col-lg-3 col-md-6 col-sm-12 " />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="rbno" runat="server" Text="No" GroupName="active" />
      
    </div>
                <div class="form-group">
                     <asp:Button ID="btnsbt" runat="server" Text="Submit" OnClick="btnsbt_Click" CssClass="btn btn-primary"  />
                    <asp:Button ID="btnclear" runat="server" Text="Clear" OnClick="btnclear_Click" CssClass="btn btn-danger"  />
       
    </div>
      
    </div>
    
                  <%--<asp:HiddenField ID="HiddenField1" runat="server" />
            <table class="table table-responsive">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="lblbmname" runat="server" Text="Branch Name:*" CssClass="name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtbmname" runat="server" CssClass="form-control" MaxLength="20" placeholder="Branch Name*"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqbmname" runat="server" ControlToValidate="txtbmname" ErrorMessage="Please Fill Branch name" ForeColor="#ff0000"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="ragbmname" runat="server"  ControlToValidate="txtbmname" ErrorMessage="Please enter only alphabets" ValidationExpression="[a-zA-Z ]*$" ForeColor="#ff0000"></asp:RegularExpressionValidator>

                    </td>
                    </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblisactive" runat="server" Text="Is active?:*" ></asp:Label>
                    </td>
                    <td>
-                        <asp:RadioButton ID="rbyes" runat="server" Text="Yes" Checked="true" GroupName="active" />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="rbno" runat="server" Text="No" GroupName="active" />
                    </td>

                </tr>
                 <tr>
                    <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnsbt" runat="server" Text="Submit" OnClick="btnsbt_Click" CssClass="btn btn-primary"  />
                        &nbsp;&nbsp;
                        &nbsp;&nbsp;
                        <asp:Button ID="btnclear" runat="server" Text="Clear" OnClick="btnclear_Click" CssClass="btn btn-danger"  />
                    </td>
                </tr>
                </table>--%>
                 <br />
       
        </center>
         <center>
            <div id="divline">
                <h3>Gridview details</h3>
            </div>
             </center>
             <br />
             <div class="grid">
             <strong> Search Branch:</strong>
        <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" Width="200px" OnTextChanged="txtsearch_TextChanged" AutoPostBack="true"></asp:TextBox>
                 </div>
             <br />
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive" Width="65%" HeaderStyle-BackColor="#ff6600" AutoGenerateColumns="False" PageSize="10" AllowPaging="true" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" >

                <Columns>
                    <asp:TemplateField HeaderText="Row Number" ItemStyle-Width="100">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="branchname" HeaderText="Branch name" SortExpression="branchname" />

                    <asp:TemplateField HeaderText="IsActive" SortExpression="isactive">
                        <ItemTemplate>
                            <asp:Button BackColor="Transparent" BorderStyle="None" ID="btnIsActive" CommandName="ActiveClick" CommandArgument='<%# Eval("id")%>' OnClientClick="Confirm()" CausesValidation="false" Text='<%# (Boolean.Parse(Eval("isactive").ToString())) ? "yes" : "no" %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="50">
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/images/edit iamge.jpg" CommandName="Edit" ToolTip="Edit" runat="server" Width="20px" Height="20px" CausesValidation="false" CommandArgument='<%# Eval("id") %>' />
                            <asp:ImageButton ImageUrl="~/images/delete-button_318-77600.jpg" CommandName="Delete" ToolTip="Delete" runat="server" Width="20px" Height="20px" CausesValidation="false" CommandArgument='<%# Eval("id") %>' />
                        </ItemTemplate>
                      
                    </asp:TemplateField>


                </Columns>

            </asp:GridView>
                
                </center>
    </form>
</body>
</html>
