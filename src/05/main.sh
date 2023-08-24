#!/bin/bash
#. help.sh
NC='\033[0m'
start=$(date +%s.%N)

if [ $# -ne 1 ]
then
    echo -e "\e[1;31mError:${NC} Not enough params"
elif [ ${1: -1} != "/" ]
then
    echo -e "\e[1;31mError:${NC} wrong param (+ratio)"
else
total=$(sudo sudo find $1 -type d | wc -l)
big_folders=$(du -Sh $1 | sort -rh | head -5 | cat -n | awk '{print $1" - "$3", "$2}')
number_files=$(sudo find $1 -type f | wc -l)
conf_files=$(sudo find $1 -type f -name "*.conf" | wc -l)
txt_files=$(sudo find $1 -type f -name "*.txt" | wc -l)
exe_files=$(sudo find $1 -type f -executable -exec du -h {} + | wc | awk '{ print $1 }')
log_files=$(sudo find $1 -type f -name "*.log" | wc -l)
archive_files=$(sudo find $1 -regex '.*\(tar\|zip\|gz\|rar\)' | wc -l )
symb_files=$(sudo find $1 -type l | wc -l)
big_files=$(sudo find $1 -type f -exec du -Sh {} + | sort -rh | head -10  | cat -n | awk '{print $1" - "$3", "$2", "$3}')
big_exe_files=$(sudo find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | cat -n | awk '{print $1" - "$3", "$2}')


echo "Total number of folders (including all nested ones) = $total"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$big_folders"
echo "Total number of files = $number_files"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $conf_files"
echo "Text files = $txt_files"
echo "Executable files = $exe_files"
echo "Log files (with the extension .log) = $log_files"
echo "Archive files = $archive_files"
echo "Symbolic links = $symb_files"
echo "TOP 10 files of maximum size arranged in descending order (path, size):"
echo "$big_files"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size)"
echo "$big_exe_files"
end=$(date +%s.%N)
diff=$(echo "scale=3; $end - $start" | bc)
echo "Script execution time (in seconds) = $diff"
fi
