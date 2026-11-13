param(
    [Parameter(Mandatory = $true)][string]$Dir,
    [int]$Port = 8081
)

# marp-cli is installed per-year folder (e.g. 2026/), so run from there
Push-Location (Join-Path $PSScriptRoot "..\$Dir")
try {
    $env:PORT = $Port
    npx marp -s . --html --allow-local-files
} finally {
    Pop-Location
}
