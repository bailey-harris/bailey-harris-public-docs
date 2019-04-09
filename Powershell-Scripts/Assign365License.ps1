param(
[string]$name)
$UserCredential = Get-Credential
Connect-MsolService -Credential $UserCredential

Set-MsolUser -UserPrincipalName "$name" -UsageLocation "US"
Set-MsolUserLicense -UserPrincipalName "$name" -AddLicenses "3348210807:SPB"
