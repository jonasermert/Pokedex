FROM ubuntu:latest
LABEL authors="jonasermert"

ENTRYPOINT ["top", "-b"]