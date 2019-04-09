# Disable User Account
## Accounts to disable
* ComputerEase
* ExpenseEase
* Procore
* Active Directory
* Azure AD (automatic)
## Before you start
* Convert Mailbox to shared and assign user permissions
* Backup user OneDrive
* Backup user Email
### Convert Mailbox to shared and assign user permissions
1. Navigate to https://outlook.office365.com/ecp to open the Exchange Admin center
2. Click <strong>recipients</strong>
3. Highlight user then click <Strong>Convert to Shared Mailbox</strong>
4. After the conversion is complete, click the pencil icon to edit the mailbox
5. In the Edit User Mailbox window, click <strong> mailbox delegation</strong>
6. Under Full Access, click the + symbol
7. In the Select Full Access windows, select the user that will be responsible for the users emails, click <strong>add</strong>
8. Click <strong>OK</strong>, then <strong>Save</strong>
> Note: To perform using powershell 
<pre><code class="lang-powershell">Get-Mailbox -identity "Terry Adams" | Set-Mailbox -Type Shared</code></pre>
<pre><code class="lang-powershell">Add-MailboxPermission -Identity "Terry Adams" -User "Kevin Kelly" -AccessRights FullAccess -InheritanceType All</code></pre>
### Backup OneDrive
1. Open https://admin.microsoft.com/
2. Click <strong>Users > Active users</strong>
3. Click a user to highlight their account
4. On the new pop-up blade, click <strong>Onedrive</strong>
5. Click <strong>Create link to file</strong>
6. Click the newly created link, this will open the user's onedrive page
7. On the Onedrive page belonging to the user, click the checkbox that selects all files and folders
8. Click <strong> Download</strong>
9. Copy zip file to \\server-2016\archive\users\\{firstinitiallastname}\ 
> e.g. \\server-2016\archive\users\AHarris\
### Backup E-Mail
> Note: This section requires Internet Explorer or Microsoft Edge to complete
1. Visit https://protection.office.com/
2. Click <Strong>Search</strong>, then click <strong>Content Search</strong>
3. Click <strong>New search</strong>
4. Under Locations, click <strong>Modify...</strong> beside Specific locations
5. Click <strong>Choose users, groups, or teams</strong>
6. Click <strong>Choose users, groups, or teams</strong>
7. Search for user
8. Mark the checkbox by the user's name and click <strong>Choose</strong>
9. Click <strong>Done</strong>
10. Click <strong>Save</strong>
11. Click <strong>Save & run</strong>
12. Enter a Name and Description for the Email backup
13. Click <strong>Save</strong>
14. At the main search page, click the recently created search
15. On the new pop-up blade, click <strong>More</strong>, then <strong>Export results</strong>
16. Under Output options, select <strong>All items, including ones that have unrecognized format, are encrypted, or weren't indexed for other reasons</strong>
17. Under Export Exchange content as, select <strong>One PST file for each mailbox</strong>
18. Click <strong>Export</strong>
19. Click <strong>Close</strong>
20. Near the top of the page, click <strong>Exports</strong> to switch to the Export tab
21. Select the export you just create, then click <strong>Download results</strong>
22. An application will launch, it has two blanks
23. On the webpage, find the section Export key: and click <strong>Copy to clipboard</strong>
24. Paste the key into the first blank text box
25. For the  Location, Type to \\server-2016\archive\users\\{firstinitiallastname}\ 
> e.g. \\server-2016\archive\users\AHarris\
26. Click <strong>Start</strong>
> Note: It is recommended to perform these actions on a server or another PC that will not go to sleep during the download process.

### ComputerEase
1. Open ComputerEase via RemoteApp or local install.
2. Log in to Company 1 as User ID: <strong> PW MAINT </strong>
3. Highlight user from list and click <strong>Edit user</strong>
4. Click <strong>Disable User </strong>
### ExpenseEase
1. Open ComputerEase via RemoteApp or local install.
2. Log in to Company 1 as a User with <strong>Expense Management permissions > work on payees</strong>
3. Click <strong> Accounts Payable, Expense Management</strong>, then <strong> work on payees</strong>
4. Highlight the user, then select <strong>Deactivate Payee</strong>

### Procore
1. Visit https://app.procore.com and login
2. Under <strong>Core Tools</strong>, select <Strong>Directory</Strong>
3. Check the check-box beside the user then click <strong>Bulk Actions>Inactivate</strong>
### Active Directory
1. Open <strong>Active Directory Users and Computers</strong>
2. Navigate to proper OU and right-click user then click <strong> Disable</strong>
3. Move the user to the <strong>Disabled</strong> OU
### Azure AD
> Note: When you move the user to Disabled it will automatically remove the user when the server syncs.
> However, we need the account live until the shared mailbox is no longer needed
1. Visit https://admin.microsoft.com 
2. Click <strong>Users>Deleted Users</strong>
3. Select User
4. Click <strong>Restore</strong>
5. Select <strong>Auto-generate password</strong>
6. Click <strong>Restore</strong>
7. Click <strong>Close</strong>




