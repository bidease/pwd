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
docker run --rm -it bidease/pwd bcrypt
```

Generate a hash to log into the OS (ssh):

```shell
docker run --rm -it bidease/pwd sha512
```
