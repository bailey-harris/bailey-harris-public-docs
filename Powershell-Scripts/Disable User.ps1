$username = Read-Host "Enter the user you wish to disable(eg. JSmith)"
Get-ADUser $username | Move-ADObject -TargetPath "OU=Disabled,DC=bailey-harris,DC=local"
Disable-ADAccount -Identity $username
#$forwardemail = Read-Host "Do you wish to forward their Email?(Y/n)"
#if ($forwardemail -eq 'y'){
#	$name = Read-Host "Who do you wish to receive the email?(eg. JSmith)"
#Set-ADUser $name -add @{'ProxyAddresses'="smtp:$username@baileyharris.com"}
#}