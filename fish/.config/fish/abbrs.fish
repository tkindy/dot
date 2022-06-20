if status --is-interactive
  abbr --add --global g   git
  abbr --add --global ga  'git add'
  abbr --add --global gb  'git branch'
  abbr --add --global gc  'git commit'
  abbr --add --global gd  'git diff'
  abbr --add --global gh  'git stash'
  abbr --add --global ghd 'git stash drop'
  abbr --add --global ghl 'git stash list'
  abbr --add --global ghp 'git stash pop'
  abbr --add --global ghs 'git stash show -p'
  abbr --add --global gl  'git log'
  abbr --add --global glg 'git log --oneline --graph --decorate --branches'
  abbr --add --global gp  'git pull'
  abbr --add --global gr  'git restore'
  abbr --add --global grs 'git restore --staged'
  abbr --add --global gs  'git status'
  abbr --add --global gt  'git switch'
  abbr --add --global gtc 'git switch -c'
  abbr --add --global gu  'git push'
  abbr --add --global gx  'git checkout'
  abbr --add --global gxm 'git checkout master'

  alias vim nvim
end
