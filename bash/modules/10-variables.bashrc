# variables.bashrc

CURRENTHOUR='$(date +%H)'
CURRENTMINUTE='$(date +%M)'
CURRENTSECOND='$(date +%S)'
CURRENTUSER=$(whoami)
CURRENTHOSTNAME=$(hostname)
BLACKFG=$(tput setaf 0)
REDFG=$(tput setaf 1)
GREENFG=$(tput setaf 2)
YELLOWFG=$(tput setaf 3)
BLUEFG=$(tput setaf 4)
MAGENTAFG=$(tput setaf 5)
CYANFG=$(tput setaf 6)
WHITEFG=$(tput setaf 7)
BLACKBG=$(tput setab 0)
REDBG=$(tput setab 1)
GREENBG=$(tput setab 2)
YELLOWBG=$(tput setab 3)
BLUEBG=$(tput setab 4)
MAGENTABG=$(tput setab 5)
CYANBG=$(tput setab 6)
WHITEBG=$(tput setab 7)
BOLD=$(tput bold)
REVERSE=$(tput rev)
RESET=$(tput sgr0)
