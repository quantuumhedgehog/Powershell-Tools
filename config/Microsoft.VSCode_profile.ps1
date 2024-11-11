<#
.SYNOPSIS
    Pre-initialization, module imports, and script loading for a PowerShell profile.

.DESCRIPTION
    This script performs several tasks to initialize a PowerShell environment:
    - Removes update files for the current PowerShell version.
    - Sets console output encoding and security protocol.
    - Configures PSReadLine options.
    - Imports required modules.
    - Loads additional scripts.
    - Initializes Aliae, Zoxide and Oh-my-posh.

.NOTES
    Author: [quantuumhedgehog]
    Version: 1.0

#>

## PreInit
# Avoid Powershell new version notification.
try {
    # Get the current PowerShell version
    $psVersion = $PSVersionTable.PSVersion.ToString()
    # Construct the path to the update files
    $updatePath = [System.IO.Path]::Combine($env:LOCALAPPDATA, "Microsoft\PowerShell\$psVersion\update*")
    # Attempt to remove the update files
    Remove-Item -Path $updatePath -Force
}
catch {
    Write-Warning "Failed to remove update files: $_"
}

# Set console output encoding to UTF-8
[Console]::OutputEncoding = [Text.Encoding]::UTF8
# Set security protocol to TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Configure PSReadLine options
$PSReadLineOptions = @{
    EditMode                      = "Windows"
    HistoryNoDuplicates           = $true
    HistorySearchCursorMovesToEnd = $true
    PredictionViewStyle           = "ListView"
    PredictionSource              = "HistoryAndPlugin"
    Colors                        = @{
        "Command" = "#8181f7"
        "Comment" = "`e[92m"
    }
}
Set-PSReadLineOption @PSReadLineOptions

# Setup Oh My Posh
oh-my-posh init pwsh --config ./emodipt-extend-custom.omp.json | Invoke-Expression

# Setup Aliae