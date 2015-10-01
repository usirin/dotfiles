gdiff() { git diff --color "$@" }

sdiff() { svn diff "$@" | view - }

kdbe() { ./configure && ./go/build.sh && supervisorctl reload }


