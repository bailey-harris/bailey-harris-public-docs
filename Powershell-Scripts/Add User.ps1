param(
[string]$firstlastname, #= Read-Host "What is the user's First and Last Name?"
[string]$cellphone)
Write-Host @"
1 = Senior Project Manager
2 = Project Manager
3 = Assistant Project Manager
4 = Project Engineer
5 = Senior Superintendent
6 = Superintendent
7 = Assistant Superintendent
8 = Field Engineer
9 = Accounting Assistant/Payroll Administrator
Enter the number corresponding to the Job Position(eg. 1 for Senior Project Manager)
"@
$position = Read-Host
#$cellphone = Read-Host "Enter the user's 10 digit cell phone number with no spaces or dashes"
$cellphoneformatted = "("+$cellphone.SubString(0,3)+") "+$cellphone.Substring(3,3)+"-"+$cellphone.Substring(6,4)
$first,$last = ($firstlastname).Split(" ")
$username = $first[0]+$last
if ($position -eq '1') {$title = "Senior Project Manager" 
$OUpath = "OU=Project Managers,OU=Users,OU=Employees,DC=bailey-harris,DC=local"}
if ($position -eq '2') {$title = "Project Manager"
$OUpath = "OU=Project Managers,OU=Users,OU=Employees,DC=bailey-harris,DC=local"}
if ($position -eq '3') {$title = "Assistant Project Manager"
$OUpath = "OU=Project Managers,OU=Users,OU=Employees,DC=bailey-harris,DC=local"}
if ($position -eq '4') {$title = "Project Engineer"
$OUpath = "OU=Project Managers,OU=Users,OU=Employees,DC=bailey-harris,DC=local"}
if ($position -eq '5') {$title = "Senior Superintendent"
$OUpath = "OU=Superintendents,OU=Users,OU=Employees,DC=bailey-harris,DC=local"}
if ($position -eq '6') {$title = "Superintendent"
$OUpath = "OU=Superintendents,OU=Users,OU=Employees,DC=bailey-harris,DC=local"}
if ($position -eq '7') {$title = "Assistant Superintendent"
$OUpath = "OU=Superintendents,OU=Users,OU=Employees,DC=bailey-harris,DC=local"}
if ($position -eq '8') {$title = "Field Engineer"
$OUpath = "OU=Superintendents,OU=Users,OU=Employees,DC=bailey-harris,DC=local"}
if ($position -eq '9') {$title = "Accounting Assistant/Payroll Administrator" 
$OUpath = "OU=Accounting,OU=Users,OU=Employees,DC=bailey-harris,DC=local"}
if ($position -eq 'test') {$title = "Test User Job Title" 
$OUpath = "OU=ExcludedUsers,OU=Employees,DC=bailey-harris,DC=local"}
New-ADUser -Name $firstlastname  -path "$OUpath" -SamAccountName "$username" -GivenName "$first" -Surname "$last" -DisplayName "$firstlastname" -UserPrincipalName "$username@baileyharris.com" -Description "$title" -MobilePhone "$cellphoneformatted" -EmailAddress "$username@baileyharris.com"
start-sleep -s 5
Set-ADAccountPassword -Identity $username -NewPassword (ConvertTo-SecureString -AsPlainText "Harris1552" -Force)
Enable-ADAccount -Identity "$username"
Set-ADUser $username -add @{'ProxyAddresses'="SMTP:$username@baileyharris.com"}
Set-ADUser $username -add @{'ProxyAddresses'="smtp:$username@bailey-harris.com"}
Set-ADUser $username -add @{'streetAddress'="1552 Bailey Harris Drive"}
Set-ADUser $username -add @{'telephoneNumber'="(334) 821-0807"}
Set-ADUser $username -add @{'l'="Auburn"}
Set-ADUser $username -add @{'st'="AL"}
Set-ADUser $username -add @{'postalCode'="36830"}
Set-ADUser $username -add @{'title'="$title"}
Add-ADGroupMember -Identity Employees -Members $username
Add-ADGroupMember -Identity "Estimating Dept" -Members $username
Add-ADGroupMember -Identity SecurityTraining -Members $username
If (($position -eq '1') -or ($position -eq '2') -or ($position -eq '3') -or ($position -eq '4') -or ($position -eq '9')) {
Add-ADGroupMember -Identity "ComputerEase User" -Members $username}