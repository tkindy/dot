function add-alias -d "Create a Fish abbreviation"
	set abbr "$argv[1]=$argv[2]"
	set -g fish_user_abbreviations $fish_user_abbreviations $abbr
end
