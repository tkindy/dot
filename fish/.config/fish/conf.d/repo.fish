set CODE_DIR $HOME/src

function repo
  set REPO_NAME $argv[1]
  set REPO_PATH $CODE_DIR/$REPO_NAME

  if not test -d $REPO_PATH
    echo "Repo missing"

    git clone "git@git.hubteam.com:HubSpot/$REPO_NAME.git" $REPO_PATH
    or git clone "git@git.hubteam.com:HubSpotProtected/$REPO_NAME.git" $REPO_PATH
    or return

    set justCloned 1
  end

  cd $REPO_PATH

  # Track when I visit each repo
  date +%s >> .visited2

  git fetch

  set BRANCH $argv[2]

  if test -n "$BRANCH"
    git checkout $BRANCH
  end

  if test -n "$justCloned"
    if test -n "$BRANCH"
      git machete discover
    else
      git machete discover --yes
    end
  end

  if test -f pom.xml
    if test -n "$BRANCH"
       or test -n "$justCloned"
      echo "Running initial Maven build"
      mvn -T 1.5C clean test-compile -DskipValidation
    end
  end
end

complete --command repo --erase
complete --command repo --no-files
complete --command repo --arguments "(ls $CODE_DIR)"
