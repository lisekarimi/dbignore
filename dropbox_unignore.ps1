. "$PSScriptRoot\config.ps1"

# Exact names to un-ignore (files or folders)
$targetNames = @(
  # ".venv"
)

# Extensions to un-ignore
$extensions = @(
  # ".spec"
)

# Find matching files/folders
$items = Get-ChildItem -Path $parentFolder -Recurse -Force | Where-Object {
    $targetNames -contains $_.Name -or $extensions -contains $_.Extension
}

# Un-ignore each one
foreach ($item in $items) {
    Write-Output "Un-ignoring: $($item.FullName)"
    Clear-Content -Path $item.FullName -Stream com.dropbox.ignored -ErrorAction SilentlyContinue
}
