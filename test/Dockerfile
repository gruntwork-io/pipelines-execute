FROM ubuntu:latest as ubuntu
RUN apt-get update
RUN apt-get install -y curl jq

WORKDIR /app
COPY ./test_tenv_install.sh /app/test_tenv_install.sh
RUN chmod +x /app/test_tenv_install.sh

CMD ["/app/test_tenv_install.sh"]




FROM alpine:latest as alpine
RUN apk update
RUN apk add curl jq

WORKDIR /app
COPY ./test_tenv_install.sh /app/test_tenv_install.sh
RUN chmod +x /app/test_tenv_install.sh

# Run the script
CMD ["/app/test_tenv_install.sh"]