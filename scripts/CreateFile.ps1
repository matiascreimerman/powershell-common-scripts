<#
    .DESCRIPTION
        Create File (check if exists)
    .NOTES
        Create by Matías Creimerman
#>
[CmdletBinding()]
Param(
    [Parameter(Mandatory = $True)]
    [String] $FileName)

if (-not (Test-Path $FileName -PathType Leaf)) {
    
    try {
        New-Item -Path $FileName -ItemType File
    }
    catch {
        Write-Error -Message "Unable to create file '$FileName'. Error: $_" -ErrorAction Stop;
    }
    "Successfully created! '$FileName'.";
}
else {
    "File already exists!";
}