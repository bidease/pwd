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

## Requirements

- Docker
- Make (for using Makefile commands)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
