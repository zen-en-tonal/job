FROM debian:stable-slim

RUN apt-get update && apt-get install -y cron curl bash && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN touch /var/log/cron.log

CMD ["/entrypoint.sh"]
