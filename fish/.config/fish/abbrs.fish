if status --is-interactive
  # git
  abbr --add --global g   git
  abbr --add --global ga  'git add'
  abbr --add --global gb  'git branch'
  abbr --add --global gc  'git commit'
  abbr --add --global gd  'git diff'
  abbr --add --global gds 'git diff --staged'
  abbr --add --global gj  'git stash'
  abbr --add --global gjd 'git stash drop'
  abbr --add --global gjl 'git stash list'
  abbr --add --global gjp 'git stash pop'
  abbr --add --global gjs 'git stash show -p'
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
  abbr --add --global ge  'git rebase'
  abbr --add --global gem 'git rebase master'

  # git-machete
  abbr --add --global gm  'git machete'
  abbr --add --global gms 'git machete status'
  abbr --add --global gmd 'git machete diff'
  abbr --add --global gmc 'git machete discover'
  abbr --add --global gmt 'git machete traverse --fetch --whole'

  # GitHub CLI
  abbr --add --global ghpr 'gh pr create --web'

  # Maven
  abbr --add --global mcv 'mvn clean verify'
  abbr --add --global mst 'mvn clean verify -DskipTests -DskipValidation'
end
