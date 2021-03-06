<!-- <Snippet1> -->

<%@ Page language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    Sub CustomersGridView_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
  
        ' If multiple ButtonField column fields are used, use the
        ' CommandName property to determine which button was clicked.
        If e.CommandName = "Select" Then
    
            ' Convert the row index stored in the CommandArgument
            ' property to an Integer.
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
    
            ' Get the last name of the selected Customer from the appropriate
            ' cell in the GridView control.
            Dim selectedRow As GridViewRow = CustomersGridView.Rows(index)
            Dim contactNameCell As TableCell = selectedRow.Cells(1)
            Dim contactName As String = contactNameCell.Text
    
            ' Display the selected Customer.
            Message.Text = "You selected " & contactName & "."
      
        End If
    
    End Sub

    Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
  
        ' The field columns need to be created only the first time
        ' the page is loaded.
        If Not IsPostBack Then
      
            ' Dynamically create field columns to display the desired
            ' fields from the data source.
      
            ' Create a ButtonField object to allow the user to 
            ' select an Customer.
            Dim selectButtonField As New ButtonField

            selectButtonField.ButtonType = ButtonType.Button
            selectButtonField.CommandName = "Select"
            selectButtonField.HeaderText = "Select Customer"
            selectButtonField.Text = "Select"

            ' Create a BoundField object to display an Customer's last name.
            Dim contactNameBoundField As New BoundField

            contactNameBoundField.DataField = "ContactName"
            contactNameBoundField.HeaderText = "Contact Name"

            ' Create a BoundField object to display an Customer's first name.
            Dim contactTitleBoundField As New BoundField

            contactTitleBoundField.DataField = "ContactTitle"
            contactTitleBoundField.HeaderText = "Contact Title"

            ' Add the field columns to the Columns collection of the
            ' GridView control.
            CustomersGridView.Columns.Add(selectButtonField)
            CustomersGridView.Columns.Add(contactNameBoundField)
            CustomersGridView.Columns.Add(contactTitleBoundField)
      
        End If
    
    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
  <head runat="server">
    <title>ButtonField Constructor Example</title>
</head>
<body>
    <form id="form1" runat="server">
        
      <h3>ButtonField Constructor Example</h3>

      <asp:label id="Message"
        forecolor="Red"
        runat="server"
        AssociatedControlID="CustomersGridView"/>

      <asp:gridview id="CustomersGridView" 
        datasourceid="CustomersSqlDataSource" 
        autogeneratecolumns="False"
        onrowcommand="CustomersGridView_RowCommand"
        runat="server">                
      </asp:gridview>
            
        <!-- This example uses Microsoft SQL Server and connects -->
        <!-- to the Northwind sample database.                   -->
        <asp:sqldatasource id="CustomersSqlDataSource"  
          selectcommand="Select [CustomerID], [CompanyName], [ContactName], [ContactTitle] From [Customers]"
          connectionstring="<%$ ConnectionStrings:NorthWindConnection%>"
          runat="server">
        </asp:sqldatasource>
            
    </form>
  </body>
</html>

<!-- </Snippet1> -->