if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType File -Path $PROFILE -Force
} else {
  Copy-Item -Path $PROFILE -Destination "$PROFILE.old" -Force
}

$srcPath = Get-Location
$destPath = (Get-ChildItem $PROFILE).Directory

# Copy configurations
Copy-Item -Recurse -Path $srcPath\config\* -Force -Destination $destPath

# # Install packages
# winget import -i winget-requirements.json `
#               --accept-source-agreements `
#               --accept-package-agreements `
#               --disable-interactivity `
#               --ignore-warnings `
#               --ignore-unavailable `
#               --ignore-versions `
#               --no-upgrade `
#               --verbose
# # Install modules
# Install-Module posh-git -Scope CurrentUser -Force
# Install-Module posh-SSH -Scope CurrentUser -Force

# Import-Module posh-git
# Add-PoshGitToProfile -Force