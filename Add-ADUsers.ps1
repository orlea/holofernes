param ($listfile = ".\userlist-sample.csv")

Start-Transcript ((Get-Date).Tostring("yyyyMMdd")+".log") -Append

$userlist = Import-Csv $listfile

for ($i = 0; $i -lt $userlist.Count; $i++) {
  $password = ConvertTo-SecureString $userlist[$i].password -AsPlainText -Force
  $displayname = $userlist[$i].surname + " " + $userlist[$i].givenname
  $upn = $userlist[$i].id + "@" + $userlist[$i].domain
  New-ADUser -Name $displayname -SAMAccountName $userlist[$i].id -SurName $userlist[$i].surname -GivenName $userlist[$i].givenname -DisplayName $displayname -Path $userlist[$i].path -AccountPassword $password -Enabled $true -UserPrincipalName $upn
  $groups = $userlist[$i].groups.Split(",")
  for ($j = 0; $j -lt $groups.Count; $j++) {
    Add-ADGroupMember -Identity $groups[$j] -Members $userlist[$i].id
  }
  Write-Host Added $userlist[$i].id
}

Stop-Transcript