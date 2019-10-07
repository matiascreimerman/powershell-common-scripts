[CmdletBinding()]
Param(
    [Parameter(Mandatory = $True)]
    [String] $Directory)

if (-not (Test-Path -LiteralPath $Directory)) {
    
    try {
        New-Item -Path $Directory -ItemType Directory -ErrorAction Stop | Out-Null;
    }
    catch {
        Write-Error -Message "Unable to create directory '$Directory'. Error was: $_" -ErrorAction Stop;
    }
    "Successfully created directory '$Directory'.";
}
else {
    "Directory already existed";
}
