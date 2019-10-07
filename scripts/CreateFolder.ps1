<#
    .DESCRIPTION
        Create Folder (check if exists)
    .NOTES
        Create by Matías Creimerman
#>
[CmdletBinding()]
Param(
    [Parameter(Mandatory = $True)]
    [String] $Directory)

if (-not (Test-Path -LiteralPath $Directory)) {
    
    try {
        New-Item -Path $Directory -ItemType Directory -ErrorAction Stop | Out-Null;
    }
    catch {
        Write-Error -Message "Unable to create directory '$Directory'. Error: $_" -ErrorAction Stop;
    }
    "Successfully created! '$Directory'.";
}
else {
    "Directory already exists!";
}
