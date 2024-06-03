#!/bin/sh

function bcrypt() {
  echo -n 'Password: ' && read -s pwd && echo && echo -n $pwd | htpasswd -bnBC 10 '' $pwd | tr -d ':'
}

function sha512() {
  echo -n 'Password: ' && read -s pwd && echo && echo $pwd | mkpasswd -m sha512
}

case $1 in
  bcrypt )
    bcrypt;;
  sha512 )
    sha512;;
  help | * )
    echo 'Usage: docker run --rm -it <option>'
    echo 'Options:'
    echo '  bcrypt: Generate bcrypt password hash'
    echo '  sha512: Generate sha512 password hash'
    exit
esac
