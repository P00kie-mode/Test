#!/bin/bash

# Path to Unity project folder (current directory)
projectFolder="$(pwd)"
outputZip="$projectFolder/UnityProjectBackup.zip"

# Folders to exclude from zipping
excludeFolders=("Library" "Temp" "Logs" "Obj")

# Build the exclude parameters for the zip command
excludeParams=()
for folder in "${excludeFolders[@]}"; do
    excludeParams+=("--exclude=$folder/*")
done

# Remove existing ZIP file if it exists
if [ -f "$outputZip" ]; then
    echo "Removing existing ZIP file..."
    rm "$outputZip"
fi

# Zip the project, excluding specified folders
echo "Zipping project folder (excluding: ${excludeFolders[*]})..."
zip -r "$outputZip" . "${excludeParams[@]}"

if [ $? -eq 0 ]; then
    echo "Project zipped successfully to $outputZip."
else
    echo "Error zipping project."
fi
