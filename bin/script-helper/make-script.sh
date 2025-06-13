#!/bin/bash

group="" 

while getopts "g:" opt; do
  case $opt in
    g)
      group="$OPTARG"
      ;;
    ?)
      exit 1
      ;;
  esac
done

shift $((OPTIND - 1))

if [ -z "$group" ]; then
	for ((i = 1; i<=$#; i++)); do
		echo -e "#!/bin/bash\n# ${!i}\n# Description: " > "$(pwd)/${!i}.sh" 
		chmod +x "$(pwd)/${!i}.sh"  
	done
else
	dir="/home/jas/Scripts/$group"
	for ((i = 1; i<=$#; i++)); do
		echo -e "#!/bin/bash\n# ${!i}\n# Description: " > "$dir/${!i}.sh" 
		chmod +x "$dir/${!i}.sh"  
	done

fi
