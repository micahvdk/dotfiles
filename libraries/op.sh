# Imports SSH keys from OnePassword using title as file name
function op::import::ssh_keys() {
  local org_name
  org_name="$2"
  email="$1"
  if op get account 2>/dev/null | jq '.name' | grep "${org_name}"; then
    echo "OnePassword currently logged in"
  else
    echo "Need to login to OnePassword account"
    eval $(op signin "${org_name}".1password.com "${email}" )
  fi
  for item in $(op list items --tags cli,ssh-key --vault private); do
    ssh_key_name=$(echo "${item}" | op get item - --fields title)
    log::info "Importing SSH Key ${ssh_key_name}"
    echo -e $(echo "${item}" | op get item - --fields public_key) > ~/.ssh/"${ssh_key_name}.pub"
    echo -e $(echo "${item}" | op get item - --fields private_key) > ~/.ssh/"${ssh_key_name}"
  done
}
