RED="\e[38;5;124m"
CLEAR="\e[0m"

if [[ ! -d "subrepos" ]]
then
  printf "It looks like you aren't running from your base workspace: \"subrepos\" sub-directory does not exist.\n"
  exit
fi

currentHooks=$( git config --get --local core.hooksPath )
printf "Replacing git core.hooksPath(\"${currentHooks}\") with \".githooks\"\n"
git config --local core.hooksPath .githooks
printf "Linking \"subrepos/hooks\" to \".githooks\"\n"
ln -sF subrepos/hooks .githooks