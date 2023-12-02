#!/bin/bash

# Set the absolute path to your cover art image
COVER_ART="${HOME}/cover.jpg"

# Set the output directory
OUTPUT_DIR="${HOME}/Music_cover"

# Check if the output directory exists, create it if not
# mkdir -p "$OUTPUT_DIR"

# Loop through all MP3 files in the current directory
for file in *.mp3; do
    # Extract the file name (excluding extension) for output
    filename=$(basename -- "$file")
    filename_noext="${filename%.*}"

    # Set the output file path
    output_file="$OUTPUT_DIR/$filename"

    # Add cover art to the MP3 file using ffmpeg
    ffmpeg -i "$file" -i "$COVER_ART" -c copy -map 0 -map 1 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (Front)" "$output_file"
    
    echo "Cover art added to: $output_file"
done

