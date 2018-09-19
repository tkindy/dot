# Defined in /tmp/fish.xvrDd3/guu.fish @ line 1
function guu
	git push origin (git rev-parse --abbrev-ref HEAD) --set-upstream
end
