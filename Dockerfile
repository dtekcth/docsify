FROM nginx:1.31.9-alpine@sha256:0713660ff64e819a478be0d69ae314e52d21623c93672edd9f381a6e66fd95ff

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
