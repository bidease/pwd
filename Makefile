# Password Hash Generator
# This Makefile builds and runs a Docker container that generates password hashes.
# Available hash types:
#   - bcrypt: Generates a bcrypt hash
#   - sha512: Generates a SHA-512 hash

IMAGE_NAME ?= bidease/pwd
IMAGE_TAG ?= latest
PLATFORMS := linux/amd64,linux/arm64

.PHONY: build build-multiarch bcrypt sha512 help

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

build-multiarch:
	docker buildx create --use --name multiarch-builder || true
	docker buildx build --platform $(PLATFORMS) \
		-t $(IMAGE_NAME):$(IMAGE_TAG) \
		--push .

# Generate bcrypt hash (interactive)
bcrypt:
	docker run --rm -it $(IMAGE_NAME):$(IMAGE_TAG) bcrypt

# Generate sha512 hash (interactive)
sha512:
	docker run --rm -it $(IMAGE_NAME):$(IMAGE_TAG) sha512

# Show usage information
help:
	@echo "Password Hash Generator"
	@echo ""
	@echo "Usage:"
	@echo "  make build             Build the Docker image"
	@echo "  make build-multiarch   Build for AMD64 and ARM64 (M1+)"
	@echo "  make bcrypt            Generate bcrypt hash"
	@echo "  make sha512            Generate sha512 hash"
	@echo ""
	@echo "Example:"
	@echo "  make build && make bcrypt"
