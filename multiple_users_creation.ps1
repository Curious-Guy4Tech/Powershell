# Import the Active Directory module
Import-Module ActiveDirectory

# Import users from the CSV file
$users = Import-Csv -Path "C:\path\to\your\students.csv" -Delimiter "specify_your_delimiter_here(eg: "," or ";")" -Encoding UTF8

# Loop through each user in the CSV file 
foreach ($user in $users) {
    # Define user properties
    $firstName = $user.FirstName
    $lastName = $user.LastName
    $userName =($firstName).Substring(0,1).Tolower() +  $lastNam.ToLower()
    $password = (ConvertTo-SecureString $user.Password -AsPlainText -Force)
    $description = $user.Description
   
  # Create the new Active Directory user
    
  New-ADUser -Name "$firstName $lastName" -DisplayName "$firstName $lastName"  -SamAccountName $userName  -EmailAddress "$userName@example.com" -Path "OU=Your_OU_Name_here DC=example DC=com"  -AccountPassword $password -Enabled $true -Description $description -ChangePasswordAtLogon $true

# Display a message when the user creation is completed.

  Write-Output "Created user: $userName"
    
}
