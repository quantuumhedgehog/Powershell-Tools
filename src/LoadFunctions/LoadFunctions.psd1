@{
    # Script module or binary module file associated with this manifest.
    RootModule = 'LoadFunctions.psm1'

    # Version number of this module.
    ModuleVersion = '1.0.0'

    # Supported PSEditions
    CompatiblePSEditions = @('Core', 'Desktop')

    # ID used to uniquely identify this module
    GUID = '82a9d3ba-100e-4165-a0a0-f712e0ed3f8e'

    # Author of this module
    Author = 'quantuumhedgehog'

    # Company or vendor of this module
    CompanyName = 'quantuumhedgehog'

    # Copyright statement for this module
    Copyright = '(c) quantuumhedgehog. All rights reserved.'

    # Description of the functionality provided by this module
    Description = 'Module to manage terminal features and PowerShell environment customization.'

    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion = '7.4.2'

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @(
        'Get-CommandPath',
        'New-PathItem',
        'Get-AliasHints',
        'Get-CmdletAlias',
        'Set-ConsoleCustomization',
        'Reset-PythonEnvironment',
        'Edit-PowerShellProfile'
    )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{
        PSData = @{
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @()

            # A URL to the license for this module.
            LicenseUri = ''

            # A URL to the main website for this project.
            ProjectUri = ''

            # A URL to an icon representing this module.
            IconUri = ''

            # ReleaseNotes of this module
            ReleaseNotes = ''

            # Prerelease string of this module
            Prerelease = ''

            # Flag to indicate whether the module requires explicit user acceptance for install/update/save
            RequireLicenseAcceptance = $false

            # External dependent modules of this module
            ExternalModuleDependencies = @()
        } # End of PSData hashtable
    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    DefaultCommandPrefix = ''
}
