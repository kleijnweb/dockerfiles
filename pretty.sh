#!/usr/bin/env bash
# Color	  # FG	BG
# black	  # 30	40
# red	    # 31	41
# green	  # 32	42
# yellow	# 33	43
# blue	  # 34	44
# magenta	# 35	45
# cyan	  # 36	46
# white	  # 37	47
# Dark gray 90  100

green='\033[0;32m'
cyan='\033[0;36m'
red='\033[0;31m'
yellow='\033[0;33m'
magenta='\34[0;35m'
blue='\033[0;35m'
dgray='\033[0;90m'
nc='\033[0m' # No Color

print_em(){
  echo -e "\e[1m${1}\e[0m"
}
print_color(){
  echo -e "${!1}${2}${nc}"
}
