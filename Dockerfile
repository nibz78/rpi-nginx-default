FROM resin/rpi-raspbian

RUN apt-get update && apt-get install -y nginx-full

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY ./etc/nginx/sites-available/default /etc/nginx/sites-available/default

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]

