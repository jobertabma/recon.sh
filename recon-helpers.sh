check_environment_requirements()
{
  if [ -e ~/.recon-directory ]; then
  	directory=$(cat ~/.recon-directory)
  fi

  if [ -z "$directory" ]; then
  	echo "error: ~/.recon-directory does not exist or is empty, run recon.sh init."
    exit 1
  fi
}
