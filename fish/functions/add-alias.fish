# Defined in /tmp/fish.SMdbs9/add-alias.fish @ line 2
function add-alias
	set abbr "$argv[1]=$argv[2]"
	set -U fish_user_abbreviations $fish_user_abbreviations $argv[1]
end
