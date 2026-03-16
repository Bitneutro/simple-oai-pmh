#!/bin/bash

# Builds and pushes the simple-oai-pmh Docker image to GitHub Container Registry
#
# Usage: ./publish.sh
#
# Prerequisites:
#   - Docker installed and running
#   - Logged in to ghcr.io:
#     echo $GITHUB_TOKEN | docker login ghcr.io -u <your-github-username> --password-stdin
#   - A semantic version tag (vX.Y.Z) on the current commit

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

REGISTRY="ghcr.io/bitneutro"
IMAGE_NAME="simple-oai-pmh"

print_info()    { echo -e "${GREEN}[INFO]${NC} $1"; }
print_error()   { echo -e "${RED}[ERROR]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }

# Get version from latest semantic version tag
TAG=$(git describe --tags --abbrev=0 --match "v[0-9]*.[0-9]*.[0-9]*" 2>/dev/null || true)

if [ -z "$TAG" ]; then
    print_error "No semantic version tag found (vX.Y.Z)"
    print_error "Create one with: git tag -a v1.0.0 -m 'Release v1.0.0'"
    exit 1
fi

VERSION="${TAG#v}"
IMAGE_VERSIONED="${REGISTRY}/${IMAGE_NAME}:${VERSION}"

print_info "Version: ${VERSION} (from tag ${TAG})"
print_info "Image:   ${IMAGE_VERSIONED}"
echo ""

# Check ghcr.io login
if ! grep -q "ghcr.io" ~/.docker/config.json 2>/dev/null; then
    print_warning "You may not be logged in to ghcr.io"
    echo "  echo \$GITHUB_TOKEN | docker login ghcr.io -u <your-github-username> --password-stdin"
    echo ""
fi

# Build
print_info "Building Docker image..."
docker build -t "${IMAGE_VERSIONED}" .

print_info "Build successful!"
echo ""

# Confirm before pushing
read -p "Push ${IMAGE_VERSIONED} to registry? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_warning "Push cancelled. Image is built locally but not pushed."
    exit 0
fi

# Push
print_info "Pushing ${IMAGE_VERSIONED}..."
docker push "${IMAGE_VERSIONED}"

echo ""
print_info "Successfully published ${IMAGE_VERSIONED}"
