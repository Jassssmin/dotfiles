#!/bin/bash
# This script creates a directory in ~/Scripts with its main files

group=$1
mkdir -p "/home/jas/Scripts/$group"
cd "/home/jas/Scripts/$group" || exit
for ((i=2; i<=$#; i++)); do
	file="${!i}.sh"
	echo -e "#!/bin/bash\n# ${!i}\n# Description: " > "$file"
	chmod +x "${!i}.sh"
done
cat "/home/jas/Scripts/script-helper/template-description.txt" > "$group-info.txt"
for ((i=2; i<=$#; i++)); do
	echo " - ${!i}: " >> "$group-info.txt"
done
echo -e "\nTO-DO:\n" >> "$group-info.txt"

echo "Successfully created the group $group with $# files in it"

