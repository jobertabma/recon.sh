source "$(dirname $0)/recon-helpers.sh"

check_environment_requirements

git -C "$directory" pull --rebase
git -C "$directory" push
