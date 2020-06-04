Install-Module MicrosoftTeams
Import-Module MicrosoftTeams
Connect-MicrosoftTeams
Get-Team -DisplayName "<Team display name here>" | ForEach-Object {Get-TeamUser -GroupID $_.GroupID -Role guest} | ?{$_.User -like '*.*'} | %{$_.User.Split('#')[0].ToLower() -replace '(.*)_(.*)','$1@$2'}