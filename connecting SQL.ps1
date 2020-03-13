$Global:SCCMSQLSERVER = "localhost\bcdemo" 
$Global:DBNAME = "sqlTestDB" 
Try 
{ 
$SQLConnection = New-Object System.Data.SQLClient.SQLConnection 
$SQLConnection.ConnectionString ="server=$SCCMSQLSERVER;database=$DBNAME;Integrated Security=True;" 

#"Server = $SQLServer; Database = $SQLDBName;User ID= YourUserID; Password= YourPassword"
$SQLConnection.Open() 
} 
catch 
{ 
    [System.Windows.Forms.MessageBox]::Show("Failed to connect SQL Server:")  
} 
 
$SQLCommand = New-Object System.Data.SqlClient.SqlCommand 
$SQLCommand.CommandText = "select * from Customer" 
$SQLCommand.Connection = $SQLConnection 
 
$SQLAdapter = New-Object System.Data.SqlClient.SqlDataAdapter 
$SqlAdapter.SelectCommand = $SQLCommand                  
$SQLDataset = New-Object System.Data.DataSet 
$SqlAdapter.fill($SQLDataset) | out-null 
 
$tablevalue = @() 
foreach ($data in $SQLDataset.tables[0]) 
{ 
 $data

}  
$SQLConnection.close()