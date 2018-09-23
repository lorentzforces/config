# aliases
Set-Alias -Name g -Value git

# Set custom prompt
function Test-Administrator {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator);
}
function prompt {
  $darkColor = 0
  $promptColor = 12
  $warningColor = 14

  $timeColor = 3
  $pathColor = 5
  $usernameColor = 12

  Write-Host "`n" -NoNewline

  # timestamp
  Write-Host (Get-Date -Format G) `
    -NoNewline `
    -ForegroundColor $darkColor `
    -BackgroundColor $timeColor
  Write-Host " " `
    -NoNewline `
    -ForegroundColor $timeColor `
    -BackgroundColor $usernameColor

  # username
  if (Test-Administrator) {
    Write-Host "" `
      -NoNewline `
      -ForegroundColor $warningColor `
      -BackgroundColor $usernameColor

    Write-Host "ADMIN" `
      -NoNewline `
      -ForegroundColor $darkColor `
      -BackgroundColor $warningColor

    Write-Host " " `
      -NoNewline `
      -ForegroundColor $warningColor `
      -BackgroundColor $usernameColor
  }

  Write-Host "$ENV:USERNAME " `
    -NoNewline `
    -ForegroundColor $darkColor `
    -BackgroundColor $usernameColor
  Write-Host " " `
    -NoNewline `
    -ForegroundColor $usernameColor `
    -BackgroundColor $pathColor

  # working dir
  Write-Host $(
    $(Get-Location) -replace ($env:USERPROFILE).Replace('\', '\\'), "~"
  ) `
    -NoNewline `
    -ForegroundColor $darkColor `
    -BackgroundColor $pathColor
  Write-Host " " `
    -NoNewline `
    -ForegroundColor $darkColor `
    -BackgroundColor $pathColor
  Write-Host " " `
    -NoNewline `
    -ForegroundColor $pathColor

  Write-Host "`n :)" `
    -NoNewline `
    -ForegroundColor $promptColor
  return " "
}
