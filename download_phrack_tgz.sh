#!/bin/sh

# Create the destination directory if it doesn't exist
mkdir -p /tmp/phrack_tgz

# Change to the destination directory
cd /tmp/phrack_tgz || exit 1

# Download the index page
wget -q https://phrack.org/archives/tgz/

# Extract all tarball URLs and download them
grep -oP 'href="\K[^"]+\.tgz' index.html | while read -r url; do
    wget -q "https://phrack.org/archives/tgz/$url"
done

# Clean up the index file
rm index.html

echo "All Phrack tarballs have been downloaded to /tmp/phrack_tgz"
