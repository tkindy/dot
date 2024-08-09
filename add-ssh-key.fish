#!/opt/homebrew/bin/fish

function add
  echo "[$(date)] Adding SSH key"
  /usr/bin/ssh-add --apple-use-keychain ~/.ssh/id_rsa
  and echo "[$(date)] Added SSH key"
end

add &> ~/temp/add-ssh-key.log
