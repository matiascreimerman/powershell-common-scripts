<#
    .DESCRIPTION
        Delete Folder
    .NOTES
        Create by Matías Creimerman
#>
[CmdletBinding()]
Param(
    [Parameter(Mandatory = $True)]
    [String] $Path,
    [Parameter(Mandatory = $True)]
    [String] $Recursive
    )

if (Test-Path -LiteralPath $Path) {
    try {
        if ($Recursive){
            Remove-Item $Path -Recurse;
        }
        else{
            Remove-Item $Path;
        }
    }
    catch {
        Write-Error -Message "Unable to copy folder. Error: $_" -ErrorAction Stop;
    }
    "Successfully deleted! '.";
}
else {
    "Folder not exists!";
}