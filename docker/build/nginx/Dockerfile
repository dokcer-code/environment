FROM nginx:1.17

RUN apt-get update && apt-get -y install nano less mc

ADD conf.d/avto-servisy.loc.conf /etc/nginx/conf.d/
ADD fastcgi.conf /etc/nginx/
ADD snippets /etc/nginx/snippets
ADD ssl-cert-snakeoil.key  /etc/ssl/private/ssl-cert-snakeoil.key
ADD ssl-cert-snakeoil.pem /etc/ssl/certs/ssl-cert-snakeoil.pem