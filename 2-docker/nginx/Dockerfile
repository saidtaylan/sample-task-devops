FROM nginx:latest

RUN apt-get update && apt-get install -y keepalived

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]