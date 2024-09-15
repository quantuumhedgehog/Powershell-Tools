if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType File -Path $PROFILE -Force
} else {
  Copy-Item -Path $PROFILE -Destination "$PROFILE.old" -Force
}

$srcPath = Get-Location
$destPath = (Get-ChildItem $PROFILE).Directory

# Copy configurations
Copy-Item -Recurse -Path $srcPath\config\* -Force -Destination $destPath

# Install packages
winget import -i winget-requirements.json `
              --accept-source-agreements `
              --accept-package-agreements `
              --disable-interactivity `
              --ignore-warnings `
              --no-upgrade