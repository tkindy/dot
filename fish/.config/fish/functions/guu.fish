function guu
  if test -z "$argv[1]"
    set remote "origin"
  else
    set remote "$argv[1]"
  end

  git push $remote (git rev-parse --abbrev-ref HEAD) --set-upstream
end
