# pwd
## Build

```shell
docker login
...

docker build -t bidease/pwd .
docker push bidease/pwd
```

## Usage

Generate a hash to log into the Clickhouse:

```shell
docker run --rm -it bidease/pwd sh -c "echo -n 'Password: '; read -s pwd; echo; htpasswd -bnBC 10 '' $pwd | tr -d ':'"
```

Generate a hash to log into the OS (ssh):

```shell
docker run -it --rm bidease/pwd mkpasswd -m sha512
```
