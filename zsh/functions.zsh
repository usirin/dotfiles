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

kb() { kubectl $@ }

mkb() { minikube $@ }

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

dl-yarn() {
  dl_type=${1:-nightly}
  cmd="curl -o- -L https://yarnpkg.com/install.sh | bash"
  if [ "$dl_type" == 'nightly' ]; then
    echo "downloading nightly version..."
    curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --nightly
  elif [ "$dl_type" == 'rc' ]; then
    echo "downloading rc version..."
    curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --rc
  else
    echo "downloading latest version..."
    curl -o- -L https://yarnpkg.com/install.sh | bash
  fi

  source $HOME/.zshrc
}

ensure_line() {
  LINE=$1
  FILE=$2
  grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

microverse-webmaster-node-payment-0 () {
  microverse-webmaster-node-payment \
    --id payment-0 \
    --site-domain localhost:3064 \
    --port 3064 \
    --node-port 3054 \
    --node-url ws://localhost:3054 \
    --bootstrap-url ws://bootstrap.test.webmaster.microverse.io:3040 \
    --stripe-secret-key sk_test_ZHaSKpy3LCdWxCeJzopQYNeK
}

github-latest() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

check-tunnel () {
  pgrep -f 'ssh -f'
}

kill-tunnel () {
  pkill -f 'ssh -f'
}

mount-platform-dev () {
  ssh -f -N \
    -L 5433:samba-platform-api-dev.cxtg2qgzoexk.us-west-2.rds.amazonaws.com:5432 \
    admin@ec2-18-236-226-206.us-west-2.compute.amazonaws.com \
    -i /Users/umut.sirin/.ssh/umut.sirin@samba.tv
}

mount-platform-prod () {
  ssh -f -N \
    -L 5434:samba-platform-api-prod.cxtg2qgzoexk.us-west-2.rds.amazonaws.com:5432 \
    admin@ec2-34-209-203-126.us-west-2.compute.amazonaws.com \
    -i /Users/umut.sirin/.ssh/umut.sirin@samba.tv
}

mount-platform-staging () {
  ssh -f -N \
    -L 5435:samba-platform-api-stg.cxtg2qgzoexk.us-west-2.rds.amazonaws.com:5432 \
    admin@ec2-34-215-99-23.us-west-2.compute.amazonaws.com \
    -i /Users/umut.sirin/.ssh/umut.sirin@samba.tv
}

