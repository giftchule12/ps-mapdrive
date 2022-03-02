Write-Output "Property of "
Write-Output "
███╗░░░███╗██╗████████╗
████╗░████║██║╚══██╔══╝
██╔████╔██║██║░░░██║░░░
██║╚██╔╝██║██║░░░██║░░░
██║░╚═╝░██║██║░░░██║░░░
╚═╝░░░░░╚═╝╚═╝░░░╚═╝░░░"

Write-Output "This program will automatically create a network drive"

Write-Output "If you agree with the terms of the program click press Enter"

Read-Host -prompt "Press Enter to Continue"

$Username = "Computer"
$domain =  "\\MITSERVER\Pastel14"
$Password = ConvertTo-SecureString "22382238" -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential ($Username, $Password)

$version = $PSVersionTable.PSVersion.Major

if ($version -le 3){
    Write-Output "Lets's Create a New One!!!"
    
    $net = New-Object -ComObject WScript.Network
    $net.MapNetworkDrive("Z:", $domain, $false, $Username, "22382238")

    Get-PSDrive Z -PSProvider "Filesystem"

    Write-Output  "Drive Succesfully Mapped on $domain" 
}
else{
    Write-Output "Lets's Create a New One!!!"
    # Remove-PSDRive Z

    New-PSDrive -Name "Z" -PSProvider "FileSystem" -Root $domain -Persist -Credential $Cred

    Get-PSDrive Z -PSProvider "Filesystem"

    Write-Output  "Drive Succesfully Mapped on $domain"
}


<# if (Get-PSDrive Z -ErrorAction SilentlyContinue){
    Write-Output "Drive is in use"

    Get-PSDrive Z | Remove-PSDRive

    
    net stop workstation /y

    net start workstation
}
else{
    Write-Output "Lets's Create a New One!!!"

    New-PSDrive -Name "Z" -PSProvider "FileSystem" -Root "\\MITSERVER\Pastel14" -Persist -Credential $Cred
}
 #>
Read-Host -Prompt "Press Enter to Exit"


