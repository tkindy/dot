#!/usr/bin/fish

# Install the passed build dependencies, marking currently-missing
# packages as 'auto' for easy removal later
function install_build_deps
  set alreadyInstalled (dpkg --get-selections | \
                        grep -v deinstall | \
                        grep -oE "^("(string join "|" $argv)")\s" | \
                        sed 's/.$//')

  echo "Already installed: " $alreadyInstalled

  set notInstalled
  for dep in $argv
    if not contains $dep $alreadyInstalled
      set notInstalled $notInstalled $dep
    end
  end

  sudo apt install $argv # still use argv to update already-installed deps
  
  if count $notInstalled != 0
    sudo apt-mark auto $notInstalled # mark newly-installed packages as auto
  end
end

# Check if an apt repo exists that matches the given pattern
# Exit status:
# - 0:             there's at least one match
# - anything else: no matches
function check-repo
  cat /etc/apt/sources.list | grep -q $argv[1]
  or ls /etc/apt/sources.list.d/ | grep -q $argv[1]
end

