#!/bin/sh

bcrypt_hash() {
  printf '%s' "$1" | htpasswd -bnBC 12 '' "$1" | tr -d ':'
}

sha512_hash() {
  printf '%s' "$1" | mkpasswd -m sha512
}

read_stdin() {
  IFS= read -r PWD
  if [ -z "$PWD" ]; then
    printf 'Password cannot be empty.\n' >&2
    exit 1
  fi
}

bcrypt() {
  if [ -n "$1" ]; then
    bcrypt_hash "$1"
    return
  fi

  if [ ! -t 0 ]; then
    read_stdin
    bcrypt_hash "$PWD"
    return
  fi

  while true; do
    printf 'Password: '
    stty -echo
    read -r PWD
    stty echo
    printf '\n'

    if [ -z "$PWD" ]; then
      printf 'Password cannot be empty. Please try again.\n\n'
      continue
    fi

    printf 'Confirm password: '
    stty -echo
    read -r PWD2
    stty echo
    printf '\n'

    if [ "$PWD" = "$PWD2" ]; then
      bcrypt_hash "$PWD"
      break
    else
      printf 'Passwords do not match. Please try again.\n\n'
    fi
  done
}

sha512() {
  if [ -n "$1" ]; then
    sha512_hash "$1"
    return
  fi

  if [ ! -t 0 ]; then
    read_stdin
    sha512_hash "$PWD"
    return
  fi

  while true; do
    printf 'Password: '
    stty -echo
    read -r PWD
    stty echo
    printf '\n'

    if [ -z "$PWD" ]; then
      printf 'Password cannot be empty. Please try again.\n\n'
      continue
    fi

    printf 'Confirm password: '
    stty -echo
    read -r PWD2
    stty echo
    printf '\n'

    if [ "$PWD" = "$PWD2" ]; then
      sha512_hash "$PWD"
      break
    else
      printf 'Passwords do not match. Please try again.\n\n'
    fi
  done
}

case $1 in
  bcrypt )
    bcrypt "$2";;
  sha512 )
    sha512 "$2";;
  help | * )
    echo 'Usage: docker run --rm -it <option> [password]'
    echo 'Options:'
    echo '  bcrypt [password]: Generate bcrypt password hash'
    echo '  sha512 [password]: Generate sha512 password hash'
    echo ''
    echo 'If [password] is provided, the hash is generated non-interactively.'
    echo 'If stdin is not a TTY, the password is read from stdin (e.g. echo -n pw | ...).'
    exit
esac
