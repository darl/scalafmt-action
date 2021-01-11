# Container image that runs your code
FROM alpine:3.12

RUN apk --no-cache add git

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN wget 'https://github.com/scalameta/scalafmt/releases/download/v2.7.5/scalafmt-linux-musl' -q -O /scalafmt

RUN chmod +x /scalafmt

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]