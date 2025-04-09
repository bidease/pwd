#!/bin/sh

bcrypt() {
  while true; do
    printf 'Password: '
    stty -echo
    read -r PWD
    stty echo
    printf '\n'

    printf 'Confirm password: '
    stty -echo
    read -r PWD2
    stty echo
    printf '\n'

    if [ "$PWD" = "$PWD2" ]; then
      printf '%s' "$PWD" | htpasswd -bnBC 10 '' "$PWD" | tr -d ':'
      break
    else
      printf 'Passwords do not match. Please try again.\n\n'
    fi
  done
}

sha512() {
  while true; do
    printf 'Password: '
    stty -echo
    read -r PWD
    stty echo
    printf '\n'

    printf 'Confirm password: '
    stty -echo
    read -r PWD2
    stty echo
    printf '\n'

    if [ "$PWD" = "$PWD2" ]; then
      printf '%s' "$PWD" | mkpasswd -m sha512
      break
    else
      printf 'Passwords do not match. Please try again.\n\n'
    fi
  done
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
