# #!/bin/bash

# # Example version strings
# version1="1.5.3"
# version2="1.2.4"
# version3="2.0.0"

# # Split the version strings into an array using the dot separator
# IFS='.' read -ra v1 <<< "$version1"
# IFS='.' read -ra v2 <<< "$version2"
# IFS='.' read -ra v3 <<< "$version3"

# # Loop through each segment of the version strings and compare
# for i in "${!v1[@]}"; do
#     if ((v1[i] < v2[i])); then
#         echo "$version1 is less than $version2"
#         break
#     elif ((v1[i] > v2[i])); then
#         echo "$version1 is more than $version2"
#         break
#     fi
# done

# # Compare two different versions
# for i in "${!v1[@]}"; do
#     if ((v1[i] < v3[i])); then
#         echo "$version1 is less than $version3"
#         break
#     elif ((v1[i] > v3[i])); then
#         echo "$version1 is more than $version3"
#         break
#     fi
# done
#!/bin/bash

# Define the allowed range
MIN_VERSION=1.0.0
MAX_VERSION=1.5.2

# Define a function to compare versions
version_gt() { test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"; }

# Parse the input version
input_version="$1"

# Check if the input version is within the allowed range
if version_gt "$input_version" "$MAX_VERSION" || version_gt "$MIN_VERSION" "$input_version"; then
    echo "Invalid version. Allowed range: $MIN_VERSION - $MAX_VERSION"
    exit 1
else
    echo "Input version $input_version is valid"
fi
