# Defined in /tmp/fish.SMdbs9/add-alias.fish @ line 2
function add-alias
	set abbr "$argv[1]=$argv[2]"
	set -g fish_user_abbreviations $fish_user_abbreviations $abbr
end
