# Bluebeam Revu Intune Deployement
1. Open https://devicemanagement.microsoft.com 
2. Click <strong>Client Apps</strong>
3. Select <strong>Apps</strong>
4. Click <strong>Add</strong>
5. For App type, select <strong>Line-of-business app</strong>
6. Under App package file, select the MSI from the Bluebleam Enterprise Deployment Guide found on the Bluebeam website
7. Under Command Line Arguements, Enter `BB_SERIALNUMBER={Serial} BB_PRODUCTKEY={ProductKey} BB_EDITION=0 DA=1 /qn` replacing with the correct values
8. Save and assign to AD Group
