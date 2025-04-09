#!/bin/sh

bcrypt() {
  printf 'Password: '
  stty -echo
  read -r PWD
  stty echo
  printf '\n'
  printf '%s' "$PWD" | htpasswd -bnBC 10 '' "$PWD" | tr -d ':'
}

sha512() {
  printf 'Password: '
  stty -echo
  read -r PWD
  stty echo
  printf '\n'
  printf '%s' "$PWD" | mkpasswd -m sha512
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
