FROM nginx:1.31.8-alpine@sha256:785835ea65db4bba6f021acc0f3be91b0fef76a53fe41f8588c6698d2aed0606

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
