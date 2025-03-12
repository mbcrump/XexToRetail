param($filePath)

# Get the full path of the selected file
$selectedFile = $filePath

# Run XexTool.exe with the specified parameters and the selected file
& "D:\X360\Tools\XePatcher\XexTool.exe" -m r -r a $selectedFile

# Get the directory of the selected file
$directory = Split-Path -Path $selectedFile -Parent

# Define the path for default.xex
$defaultXexPath = Join-Path -Path $directory -ChildPath "default.xex"

# Check if default.xex already exists
if (Test-Path -Path $defaultXexPath) {
    Write-Host "A file named 'default.xex' already exists in the directory."
    $overwrite = Read-Host -Prompt "Do you want to overwrite it? (Y/N)"
    
    if ($overwrite -eq "Y" -or $overwrite -eq "y") {
        Copy-Item -Path $selectedFile -Destination $defaultXexPath -Force
        Write-Host "File copied to 'default.xex' (overwritten)."
    } else {
        Write-Host "Operation cancelled. 'default.xex' was not created."
    }
} else {
    # Copy the file to default.xex
    Copy-Item -Path $selectedFile -Destination $defaultXexPath
    Write-Host "File copied to 'default.xex'."
}

# Add a pause to see the output before closing
Read-Host -Prompt "Press Enter to exit"
