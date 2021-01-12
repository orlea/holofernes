param ($listfile = ".\userlist-workgroup-sample.csv")

Start-Transcript ((Get-Date).Tostring("yyyyMMdd")+".log") -Append

$userlist = Import-Csv $listfile

for ($i = 0; $i -lt $userlist.Count; $i++) {
  $password = ConvertTo-SecureString $userlist[$i].password -AsPlainText -Force
  New-LocalUser $userlist[$i].id -FullName $userlist[$i].name -Password $password


  $groups = $userlist[$i].groups.Split(",")
  for ($j = 0; $j -lt $groups.Count; $j++) {
    Add-LocalGroupMember -Group $groups[$j] -Member $userlist[$i].id
  }
  Write-Host Added $userlist[$i].id
}

Stop-Transcript