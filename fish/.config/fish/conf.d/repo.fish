set CODE_DIR $HOME/src

function repo
  set REPO_NAME $argv[1]
  set REPO_PATH $CODE_DIR/$REPO_NAME

  if not test -d $REPO_PATH
    echo "Repo missing"
    cd $CODE_DIR

    git clone "git@git.hubteam.com:HubSpot/$REPO_NAME.git"
    or git clone "git@git.hubteam.com:HubSpotProtected/$REPO_NAME.git"
  end

  cd $REPO_PATH

  # Track last time we visited each repo
  touch .visited
end

complete -c repo -f
complete -c repo -a "(ls $CODE_DIR)"
