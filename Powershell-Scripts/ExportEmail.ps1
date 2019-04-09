# Create Compliance Search - Export Email
param(
[string]$Searchname)

New-ComplianceSearch -ExchangeLocation $Searchname -Name $SearchName

 

# Start Compliance Search and wait to complete

Start-ComplianceSearch $SearchName

 

do

{

Start-Sleep -s 5

$complianceSearch = Get-ComplianceSearch $SearchName

 

}

while ($complianceSearch.Status -ne 'Completed')

 

# Create Compliance Search in exportable format

New-ComplianceSearchAction -SearchName $SearchName -EnableDedupe $true -Export -Format FxStream -ArchiveFormat PerUserPST

 

#Wait for Export to complete

do

{

Start-Sleep -s 5

$complete = Get-ComplianceSearchAction -Identity $ExportName

 

}


while ($complete.Status -ne 'Completed')