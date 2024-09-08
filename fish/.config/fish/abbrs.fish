if status --is-interactive
  # core
  abbr --add --global c   clear

  # git
  abbr --add --global g   git
  abbr --add --global ga  'git add'
  abbr --add --global gb  'git branch'
  abbr --add --global gbm 'git branch -m'
  abbr --add --global gbd 'git branch -d'
  abbr --add --global gc  'git commit'
  abbr --add --global gca 'git commit --amend'
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
  abbr --add --global geom 'git rebase --onto master'

  # git-machete
  abbr --add --global gm  'git machete'
  abbr --add --global gms 'git machete status'
  abbr --add --global gmd 'git machete diff'
  abbr --add --global gml 'git machete log'
  abbr --add --global gmc 'git machete discover'
  abbr --add --global gmt 'git machete traverse --fetch --whole --no-push-untracked'
  abbr --add --global gma 'git machete add'
  abbr --add --global gmr 'git machete reapply'

  # GitHub CLI
  abbr --add --global ghpr 'gh pr create --web'

  # Maven
  abbr --add --global mcv  'mvn clean verify'
  abbr --add --global mst  'mvn -T 1.5C clean test-compile -DskipValidation'
  abbr --add --global mdcv 'mvnd clean verify'
end
