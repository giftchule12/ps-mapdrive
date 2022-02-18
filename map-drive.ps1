Write-Output "
███╗░░░███╗██╗████████╗
████╗░████║██║╚══██╔══╝
██╔████╔██║██║░░░██║░░░
██║╚██╔╝██║██║░░░██║░░░
██║░╚═╝░██║██║░░░██║░░░
╚═╝░░░░░╚═╝╚═╝░░░╚═╝░░░"

# $Credentials = Get-Credential -Credential Computer
# $Credentials.Password | ConvertFrom-SecureString | Set-Content password.txt
# $Username = Get-Credential -Credential admin

# $Password = Get-Content "password.txt" | ConvertTo-SecureString

Write-Output "This program will automatically create a network drive"

Write-Output "If you agree with the terms of the program click press Enter"

Read-Host -prompt "Press Enter to Continue"

function deleteDrive {
    Write-Output "4"

    Write-Output "Drive is in use"

    Get-PSDrive Z | Remove-PSDRive

    
    net stop workstation /y

    net start workstation
}
function createDrive{
    Write-Output "2"

    Write-Output "Lets's Create a New One!!!"

    New-PSDrive -Name "Z" -PSProvider "FileSystem" -Root "\\MITSERVER\Pastel14" -Persist -Credential $Cred
}


$Username = "Computer"
$Password = ConvertTo-SecureString "22382238" -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential ($Username, $Password)

Get-PSDrive Z

if (Get-PSDrive Z -ErrorAction SilentlyContinue){
    Write-Output "Drive is in use"

    Get-PSDrive Z | Remove-PSDRive

    
    net stop workstation /y

    net start workstation
}
else{
    Write-Output "Lets's Create a New One!!!"

    New-PSDrive -Name "Z" -PSProvider "FileSystem" -Root "\\MITSERVER\Pastel14" -Persist -Credential $Cred
}

Read-Host -Prompt "Press Enter to Exit"


