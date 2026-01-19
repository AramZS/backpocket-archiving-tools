#!/bin/zsh
# Usage: ./download-amplify.sh https://example.com/file.zip → saves as Amplify-file.zip
# Check if URL is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

URL="$1"

# Strip query parameters (everything after ?)
URL_CLEAN="${URL%%\?*}"

# Extract filename from URL
FILENAME=$(basename "$URL_CLEAN")

# Prepend 'Amplify-' to the filename
OUTPUT_FILE="Amplify-${FILENAME}"

echo "Downloading from: $URL_CLEAN"
echo "Saving as: $OUTPUT_FILE"

# Download the file
curl -L -o "$OUTPUT_FILE" "$URL"

if [ $? -eq 0 ]; then
    echo "Downloaded to: $OUTPUT_FILE"
else
    echo "Download failed"
    exit 1
fi
