<#
.SYNOPSIS
    This module provides various utility functions for PowerShell operations.

.DESCRIPTION
    This module includes functions to:
    - Get-CommandPath: Retrieves the path of a specified command.
    - New-PathItem: Creates a new directory and sets the location to it.
    - Get-AliasHints: Retrieves all aliases and their definitions.
    - Get-CmdletAlias: Retrieves aliases for a specified cmdlet.
    - Set-ConsoleCustomization: Customizes the PowerShell console window title.
    - Reset-PythonEnvironment: Resets the Python environment by uninstalling all packages and clearing the cache.
    - Edit-PowerShellProfile: Opens the PowerShell profile directory in Visual Studio Code.

.NOTES
    Author: [quantuumhedgehog]
    Version: 1.0.0
#>
# Function: Get-CommandPath
# Retrieves the path of a specified command.
function Get-CommandPath ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
Export-ModuleMember -Function Get-CommandPath

# Function: New-PathItem
# Creates a new directory and sets the location to it.
function New-PathItem ($name) {
    $(New-Item -ItemType Directory $name -ErrorAction SilentlyContinue) | Set-Location
}
Export-ModuleMember -Function New-PathItem

# Function: Get-AliasHints
# Retrieves all aliases and their definitions.
function Get-AliasHints {
    Get-Alias | Select-Object -Property Name, Definition
}
Export-ModuleMember -Function Get-AliasHints

# Function: Get-CmdletAlias
# Retrieves aliases for a specified cmdlet.
function Get-CmdletAlias ($cmdletname) {
    Get-Alias |
        Where-Object -FilterScript {$_.Definition -like "$cmdletname"} |
        Format-Table -Property Definition, Name -AutoSize
}
Export-ModuleMember -Function Get-CmdletAlias

# Function: Set-ConsoleCustomization
# Customizes the PowerShell console window title.
function Set-ConsoleCustomization {
    $Host.UI.RawUI.WindowTitle = "PowerShell $($Host.Version)"
}
Export-ModuleMember -Function Set-ConsoleCustomization

# Function: Reset-PythonEnvironment
# Resets the Python environment by uninstalling all packages and clearing the cache.
function Reset-PythonEnvironment {
    python.exe -m pip freeze > pfr.txt
    python.exe -m pip uninstall -r pfr.txt -y
    Remove-Item pfr.txt
    python.exe -m pip cache purge
}
Export-ModuleMember -Function Reset-PythonEnvironment

# Function: Edit-PowerShellProfile
# Opens the PowerShell profile directory in Visual Studio Code.
function Edit-PowerShellProfile {
    code (Get-ChildItem $Profile).Directory
}
Export-ModuleMember -Function Edit-PowerShellProfile
