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
    BellStyle                        = "None"
    ContinuationPrompt               = ">>"
    EditMode                         = "Windows"
    HistoryNoDuplicates              = $true
    HistorySaveStyle                 = "SaveAtExit"
    HistorySearchCursorMovesToEnd    = $true
    PredictionViewStyle              = "ListView"
    PredictionSource                 = "HistoryAndPlugin"
    MaximumHistoryCount              = 4096
    ExtraPromptLineCount             = 0
    PromptText                       = "{> }"
    DingDuration                     = 50
    DingTone                         = 1221
    CommandValidationHandler         = $null
    CompletionQueryItems             = 100
    MaximumKillRingCount             = 10
    ShowToolTips                     = $true
    AnsiEscapeTimeout                = 100
    Colors = @{
        "Command"                     = "#8181f7"
        "Comment"                     = "`e[92m"
        "ContinuationPrompt"          = "`e[37m"
        "Emphasis"                    = "`e[96m"
        "Error"                       = "`e[91m"
        "InlinePrediction"            = "`e[97;2;3m"
        "Keyword"                     = "`e[92m"
        "ListPrediction"              = "`e[33m"
        "ListPredictionSelected"      = "`e[48;5;238m"
        "ListPredictionTooltip"       = "`e[97;2;3m"
        "Member"                      = "`e[37m"
        "Number"                      = "`e[97m"
        "Operator"                    = "`e[90m"
        "Parameter"                   = "`e[90m"
        "Selection"                   = "`e[30;47m"
        "String"                      = "`e[36m"
        "Type"                        = "`e[37m"
        "Variable"                    = "`e[92m"
    }
}

Set-PSReadLineOption @PSReadLineOptions

# Setup Oh My Posh
$ompPath = [System.IO.Path]::Combine($env:LOCALAPPDATA, "Programs\oh-my-posh\themes")
Import-Module posh-git
Import-Module posh-ssh
oh-my-posh init pwsh -c $ompPath\illusi0n.omp.json | Invoke-Expression

# Load custom functions
Import-Module LoadFunctions
Set-Alias -Name hh -Value Get-AliasHints -Description "Alias for Get-AliasHints function from LoadFunctions module."
Set-Alias -Name ha -Value Get-CmdletAlias -Description "Alias for Get-CmdletAlias function from LoadFunctions module."
Set-Alias -Name ll -Value Get-ChildItem -Force -Description "Alias for Get-ChildItem with Force parameter."
Set-Alias -Name gcp -Value Get-CommandPath -Description "Alias for Get-CommandPath function from LoadFunctions module."
Set-Alias -Name mdcd -Value New-PathItem -Description "Alias for New-PathItem function from LoadFunctions module."
Set-Alias -Name which -Value Get-CommandPath -Description "Alias for Get-CommandPath function from LoadFunctions module."
Set-Alias -Name pyreset -Value Reset-PythonEnvironment -Description "Alias for Reset-PythonEnvironment function from LoadFunctions module."
Set-Alias -Name pwedit -Value Edit-PowerShellProfile -Description "Alias for Edit-PowerShellProfile function from LoadFunctions module."
