#!/bin/sh
raw_arch=$(uname -m)
arch=""
case $raw_arch in
  i686|i386)
    arch=i386
    ;;
  x86_64|amd64)
    arch=amd64
    ;;
  aarch64|armv8b)
    arch=arm64
    ;;
  *)
    echo "Unknown architecture: $arch"
    ;;
esac

TENV_VERSION=v1.2.0
echo "Installing with $arch"

# Install tenv
if [ -f /etc/apt/sources.list ]; then
  # Ubuntu/Debian system
  LATEST_VERSION=$(curl https://api.github.com/repos/sigstore/cosign/releases/latest | jq -r .tag_name | tr -d "v\", ")
  curl -O -L "https://github.com/sigstore/cosign/releases/latest/download/cosign_${LATEST_VERSION}_${arch}.deb"
  dpkg -i cosign_${LATEST_VERSION}_${arch}.deb
  curl -O -L "https://github.com/tofuutils/tenv/releases/latest/download/tenv_${TENV_VERSION}_${arch}.deb"
  ls
  echo $arch
  dpkg -i "tenv_${TENV_VERSION}_${arch}.deb"
elif [ -f /etc/redhat-release ]; then
  # RedHat/CentOS system
  LATEST_VERSION=$(curl https://api.github.com/repos/sigstore/cosign/releases/latest | jq -r .tag_name | tr -d "v\", ")
  curl -O -L "https://github.com/sigstore/cosign/releases/latest/download/cosign-${LATEST_VERSION}-1.x86_64.rpm"
  rpm -ivh cosign-${LATEST_VERSION}.x86_64.rpm
    curl -O -L "https://github.com/tofuutils/tenv/releases/latest/download/tenv_${TENV_VERSION}_${arch}.rpm"
  rpm -ivh "tenv_${TENV_VERSION}_${arch}.rpm"
elif [ -f /etc/apk/repositories ]; then
  # Alpine system
  apk add cosign
  curl -O -L "https://github.com/tofuutils/tenv/releases/download/v1.2.0/tenv_${TENV_VERSION}_${arch}.apk"
  ls
  apk add --allow-untrusted --no-cache "./tenv_${TENV_VERSION}_${arch}.apk"
else
  echo "Unsupported operating system"
  exit 1
fi

tenv -v