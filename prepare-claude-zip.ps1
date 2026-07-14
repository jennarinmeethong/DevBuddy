<#
.SYNOPSIS
  Build the DevBuddy Claude skill archive.

.DESCRIPTION
  Claude's skill uploader requires a zip whose ROOT contains SKILL.md (no
  wrapping folder) and whose entry paths use forward slashes, per the ZIP
  spec (APPNOTE). Windows PowerShell 5.1's Compress-Archive violates both
  when handed a directory (it nests the folder and writes backslash
  separators), so this helper builds the archive entry-by-entry with
  System.IO.Compression to guarantee a Claude-compatible layout.

  Shared by prepare-zips.bat and the PowerShell fallback in prepare-zips.sh
  so the packaging rule lives in one place.
#>
[CmdletBinding()]
param(
  [Parameter(Mandatory = $true)][string] $Source,
  [Parameter(Mandatory = $true)][string] $Destination
)

$ErrorActionPreference = 'Stop'

Add-Type -AssemblyName System.IO.Compression | Out-Null
Add-Type -AssemblyName System.IO.Compression.FileSystem | Out-Null

$sourceRoot = (Resolve-Path -LiteralPath $Source).Path
if (-not (Test-Path -LiteralPath (Join-Path $sourceRoot 'SKILL.md'))) {
  throw "SKILL.md not found at skill root: $sourceRoot"
}

if (Test-Path -LiteralPath $Destination) {
  Remove-Item -LiteralPath $Destination -Force
}

$base = $sourceRoot.TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar
$zip = [System.IO.Compression.ZipFile]::Open($Destination, 'Create')
try {
  Get-ChildItem -LiteralPath $sourceRoot -Recurse -File -Force |
    Where-Object { $_.Name -ne '.DS_Store' } |
    ForEach-Object {
      # Relative path with forward slashes keeps SKILL.md at the archive root
      # and stays spec-compliant across platforms.
      $entryName = $_.FullName.Substring($base.Length).Replace('\', '/')
      [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
        $zip, $_.FullName, $entryName,
        [System.IO.Compression.CompressionLevel]::Optimal) | Out-Null
    }
}
finally {
  $zip.Dispose()
}

if (-not (Test-Path -LiteralPath $Destination)) {
  throw "Archive was not created: $Destination"
}
