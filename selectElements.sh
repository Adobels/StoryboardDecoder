#!/bin/zsh


OUTPUT_FILE="output.xml"
TEMP_FILE="output_tmp.xml"
NODES_FILE="output_subelements.txt"
echo "<root>" > "$TEMP_FILE"
echo "🔍 Searching for .storyboard files..."
find ./Project -name "*.storyboard" -print0 | while IFS= read -r -d '' file; do
  echo "Processing: $file..."
  xmlstarlet sel --omit-decl -t -m '//viewController' -c "." -n "$file" >> "$TEMP_FILE"
done
echo "</root>" >> "$TEMP_FILE"
# Delete <subviews> from each root-level element (children of <root>)
xmlstarlet ed -d '/root/*/subviews' "$TEMP_FILE" | xmlstarlet fo > "$OUTPUT_FILE"

# Extract unique set of first-level node names under <root>
#xmlstarlet sel -t -m '/root/*/*' -v 'name()' -n "$TEMP_FILE" | sort -u > "$NODES_FILE"
xmlstarlet sel -t -m '/root/*/*' \
  -v 'name()' -o ' ' -v '@key' -n "$OUTPUT_FILE" \
  | sort | uniq -c | sort -nr > "$NODES_FILE"

#rm "$TEMP_FILE"  # Clean up temporary file

echo "Done"