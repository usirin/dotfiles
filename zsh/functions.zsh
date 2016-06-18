gdiff() { git diff --color "$@" }

sdiff() { svn diff "$@" | view - }

portlist() { sudo lsof -i :"$@" }

kdbe() { ./configure && ./go/build.sh && supervisorctl reload }


