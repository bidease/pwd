# Password Hash Generator

Docker-based tool for generating password hashes in bcrypt and sha512 formats.

## Repository

GitHub: [github.com/bidease/pwd](https://github.com/bidease/pwd)

## Build
### Local Build

```bash
# Build for current platform
make build
```

```bash
# Build for multiple platforms (AMD64 and ARM64)
make build-multiarch
```

### Docker Hub

Pre-built image is available on Docker Hub:

```bash
docker pull bidease/pwd
```

## Usage

### Interactive mode

You will be prompted for the password twice (input is hidden).

Generate bcrypt hash

```bash
make bcrypt
```

Or

```bash
docker run --rm -it bidease/pwd bcrypt
```

Generate sha512 hash

```bash
make sha512
```

Or

```bash
docker run --rm -it bidease/pwd sha512
```

### Non-interactive mode

Pass the password as a second argument. No TTY required, no confirmation prompt — useful for scripts and CI.

```bash
docker run --rm bidease/pwd bcrypt 'mypassword'
docker run --rm bidease/pwd sha512 'mypassword'
```

> Note: the password will be visible in your shell history and process list. Prefer the interactive mode for sensitive credentials.

## Requirements

- Docker
- Make (for using Makefile commands)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
