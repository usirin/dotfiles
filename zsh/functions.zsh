CLR_RESET='\033[0m'
CLR_BOLD_GREEN='\033[1;32m'
CLR_BOLD_YELLOW='\033[1;33m'

TICK="✓"
ARROW="▸"
DOT="●"

GREEN_TICK="${CLR_BOLD_GREEN}${TICK}${CLR_RESET}"
YELLOW_ARROW="${CLR_BOLD_YELLOW}${ARROW}${CLR_RESET}"

gdiff() { git diff --color "$@" }

sdiff() { svn diff "$@" | view - }

portlist() { sudo lsof -i :"$@" }

kdbe() { ./configure && ./go/build.sh && supervisorctl reload }

kd-conf() {
  ./configure --host=koding-`whoami`.oud.cc:4480 --hostname=koding-`whoami`.oud.cc --publicPort 8090 --config dev
}

oud() { /tmp/ngrok -config=/tmp/.ngrok.conf -subdomain="$@".koding-`whoami` 127.0.0.1:8090 }

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc

b2d() { eval "$(boot2docker shellinit)" }

docker-clean() {
  docker ps -aq | xargs docker rm -f
  docker images -aq | xargs docker rmi -f
}

dc() { docker-compose $@ }

dm() { docker-machine $@ }

dm-unset() {
  unset DOCKER_TLS_VERIFY
  unset DOCKER_CERT_PATH
  unset DOCKER_MACHINE_NAME
  unset DOCKER_HOST
}

dm-use() {
  MACHINE=${1:-default}
  MACHINE_NAME="${CLR_BOLD_YELLOW}${MACHINE}${CLR_RESET}"

  # Get ip of given machine
  echo -ne "${YELLOW_ARROW} Getting ip of ${MACHINE_NAME}...\r"

  IP=$(docker-machine ip $MACHINE)
  MACHINE_IP="${CLR_BOLD_YELLOW}${IP}${CLR_RESET}"

  echo -ne "${GREEN_TICK} Getting ip of ${MACHINE_NAME}: Done\r"
  echo -ne "\n"

  # Start switching to given machine
  echo -ne "${ARROW} Switching to machine ${MACHINE_NAME}...\r"

  eval "$(docker-machine env ${MACHINE})"

  echo -ne "${GREEN_TICK} Switching to machine ${MACHINE_NAME}: Done\r"

  echo \
    "\n  ${DOT} name : ${MACHINE_NAME}" \
    "\n  ${DOT} ip   : ${MACHINE_IP}"
}

