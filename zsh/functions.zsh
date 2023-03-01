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

gitroot () {
  git rev-parse --show-toplevel
}

wsuse() {
  NAME=$1
  echo "${NAME}"
  brazil workspace use \
    -p "${NAME}" \
    -p "${NAME}"CDK \
    -p "${NAME}"Twirp\
    -p "${NAME}"Schema \
    -p "${NAME}"ClientConfig \
    -vs "${NAME}"/development && \
  brazil setup platform-support
}

create-badge() {
  local small=$1
  local medium=$2
  local big=$3
  local folder=$4

  export UUID=$(uuidgen)

  echo "${UUID}"
  echo "${small}"
  echo "${medium}"
  echo "${big}"

  mkdir $folder
  cp $small ${folder}/badge-${UUID}-1.png
  cp $medium ${folder}/badge-${UUID}-2.png
  cp $big ${folder}/badge-${UUID}-3.png
}

upload-badge-staging() {
  local UUID=$1

  echo "${UUID}"
  l badge-${UUID}-1.png
  l badge-${UUID}-2.png
  l badge-${UUID}-3.png

  AWS_PROFILE=twitch-chat-aws aws s3api put-object --bucket twitch-chat-badges-staging --key badge-${UUID}-1.png --body badge-${UUID}-1.png --acl public-read
  AWS_PROFILE=twitch-chat-aws aws s3api put-object --bucket twitch-chat-badges-staging --key badge-${UUID}-2.png --body badge-${UUID}-2.png --acl public-read
  AWS_PROFILE=twitch-chat-aws aws s3api put-object --bucket twitch-chat-badges-staging --key badge-${UUID}-3.png --body badge-${UUID}-3.png --acl public-read
}

download-badge-staging() {
  local UUID=$1
  echo "${UUID}"

  AWS_PROFILE=twitch-chat-aws aws s3api get-object --bucket twitch-chat-badges-staging --key badge-${UUID}-1.png s3.small.png
  AWS_PROFILE=twitch-chat-aws aws s3api get-object --bucket twitch-chat-badges-staging --key badge-${UUID}-2.png s3.medium.png
  AWS_PROFILE=twitch-chat-aws aws s3api get-object --bucket twitch-chat-badges-staging --key badge-${UUID}-3.png s3.big.png
}

create-badge-info-staging() {

  local UUID=$1
  echo "${UUID}"

  AWS_PROFILE=twitch-chat-aws aws dynamodb put-item --region us-west-1 --table-name badges_staging_1_badge_display_info --item '{
  "badge_set": {
    "S": "no_visual:1"
  },
  "click_action": {
    "S": "none"
  },
  "description_EN": {
    "S": "Individuals with unreliable or no visuals can select this badge"
  },
  "scope": {
    "S": "global.all"
  },
  "image_id": {
    "S": "641E2528-CC09-4141-BCE8-001E36284112"
  },
  "title_EN": {
    "S": "No video"
  }
}'
}

upload-badge-prod() {
  local UUID=$1

  echo "${UUID}"
  l badge-${UUID}-1.png
  l badge-${UUID}-2.png
  l badge-${UUID}-3.png

  AWS_PROFILE=twitch-chat-aws aws s3api put-object --bucket twitch-chat-badges --key badge-${UUID}-1.png --body badge-${UUID}-1.png --acl public-read
  AWS_PROFILE=twitch-chat-aws aws s3api put-object --bucket twitch-chat-badges --key badge-${UUID}-2.png --body badge-${UUID}-2.png --acl public-read
  AWS_PROFILE=twitch-chat-aws aws s3api put-object --bucket twitch-chat-badges --key badge-${UUID}-3.png --body badge-${UUID}-3.png --acl public-read

}


rot13 () { tr 'A-Za-z' 'N-ZA-Mn-za-m' <<< $1 }

list-enabled-alarms () {
  local prefix=$1
  aws cloudwatch describe-alarms --alarm-name-prefix "$prefix-" | jq '.MetricAlarms[] | select(.ActionsEnabled == true) | "\(.AlarmName)"'
}

disable-alarms () {
  # aws cloudwatch disable-alarm-actions --alarm-names $@
  echo $@
  aws cloudwatch describe-alarms --alarm-names $@
}

disable-enabled-alarms () {
  list-enabled-alarms $1 | xargs aws cloudwatch disable-alarm-actions --alarm-names
}

patch-font () {
  docker run --rm -v $1:/in -v $2:/out nerdfonts/patcher -s -c
}

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
