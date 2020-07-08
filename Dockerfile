FROM golang:latest
RUN addgroup --gid 10001 app
RUN useradd -g 10001 -u 10001 \
    -m -d /app -s /sbin/nologin \
     app

RUN mkdir -p /app/statics/
ADD statics /app/statics/

COPY bin/invoicer /app/invoicer
USER app
EXPOSE 8080
WORKDIR /app
ENTRYPOINT /app/invoicer
