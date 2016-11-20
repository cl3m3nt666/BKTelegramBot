FROM alpine:3.4
MAINTAINER cl3m3nt <clement@le-corre.eu>
RUN apk --no-cache --update add \
    py-pip \
    python3

COPY BK /BK
WORKDIR /BK

RUN pip3 install --upgrade pip && \
    pip3 install -r /BK/requirements.txt && \
    chmod +x /BK/run.sh

EXPOSE 4000
CMD ["/bin/sh", "/BK/run.sh"]
