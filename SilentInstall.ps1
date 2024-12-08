if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType File -Path $PROFILE -Force
} else {
  Copy-Item -Path $PROFILE -Destination "$PROFILE.old" -Force
}

$srcPath = Get-Location
$destPath = (Get-ChildItem $PROFILE).Directory

# Copy configurations
Copy-Item -Recurse -Path $srcPath\config\* -Force -Destination $destPath

