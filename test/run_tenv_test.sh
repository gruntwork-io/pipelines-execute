
# Ubuntu
docker build -t ubuntu-tenv-test --target ubuntu .
docker run ubuntu-tenv-test

## Alpine
docker build -t alpine-tenv-test --target alpine .
docker run alpine-tenv-test