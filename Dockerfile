FROM alpine:3.6
ARG BUILD_DATE="N/A"
ARG VCS_REF="N/A"
ARG VCS_URL="N/A"
LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.vcs-url=$VCS_URL \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.schema-version="1.0.0-rc1" \
    maintainer="clement@le-corre.eu"

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
