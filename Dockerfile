FROM nginx:1.27.5-alpine@sha256:65645c7bb6a0661892a8b03b89d0743208a18dd2f3f17a54ef4b76fb8e2f2a10

RUN apk update && apk add \
      git \
      gettext \
      openssh-client
WORKDIR /usr/share/nginx/html
RUN rm -r *
COPY template.conf /template.conf
COPY runner.sh /runner.sh

ENV SUBDIR /
ENV LOCATION_CFG ""
ENV SERVER_CFG ""
ENV INTERVAL 3600

CMD exec sh /runner.sh
