function is-installed
  dpkg --get-selections | grep -v deinstall | grep -qE "$argv[1]"
  return $status
end

