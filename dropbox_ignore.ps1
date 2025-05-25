. "$PSScriptRoot\config.ps1"

# Exact names to ignore (files or folders)
$targetNames = @(
  ".env",
  ".git",
  ".venv",
  "node_modules",
  "memory",
  "logs",
  "dist",
  "build",
  ".ipynb_checkpoints",
  ".pytest_cache",
  "__pycache__",
  ".vscode",
  ".idea",
  ".coverage",
  ".gitignore",
  ".gitattributes"
)

# Extensions to ignore
$extensions = @(
  ".pkl",
  ".joblib",
  ".h5",
  ".npz",
  ".csv",
  ".parquet",
  ".feather",
  ".log",
  ".tmp",
  ".bak",
  ".spec"
)

# Find matching files and folders
$items = Get-ChildItem -Path $parentFolder -Recurse -Force | Where-Object {
    $targetNames -contains $_.Name -or $extensions -contains $_.Extension
}

# Ignore each one
foreach ($item in $items) {
    Write-Output "Ignoring: $($item.FullName)"
    Set-Content -Path $item.FullName -Stream com.dropbox.ignored -Value 1
}
