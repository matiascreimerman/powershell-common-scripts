<#
    .DESCRIPTION
        Copy Folders (check if exists)
    .NOTES
        Create by Matías Creimerman
#>
[CmdletBinding()]
Param(
    [Parameter(Mandatory = $True)]
    [String] $FromPath,
    [Parameter(Mandatory = $True)]
    [String] $ToPath,
    [Parameter(Mandatory = $True)]
    [String] $Filter,
    [Parameter(Mandatory = $True)]
    [String] $Recursive
    )

if ((Test-Path -LiteralPath $FromPath) -and (Test-Path -LiteralPath $ToPath)) {
    try {
        if ($Recursive){
            Copy-Item -Filter $Filter -Path $FromPath -Recurse -Destination $ToPath;
        }
        else{
            Copy-Item -Filter $Filter -Path $FromPath -Destination $ToPath;
        }
    }
    catch {
        Write-Error -Message "Unable to copy folder. Error: $_" -ErrorAction Stop;
    }
    "Successfully copied! '.";
}
else {
    "Folder not exists!";
}