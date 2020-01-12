FROM nginx:1.17

RUN apt-get update && apt-get -y install \
	nano \
	less \
	mc \
	&& rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/
COPY fastcgi.conf /etc/nginx/
COPY snippets /etc/nginx/snippets
COPY ssl-cert-snakeoil.key  /etc/ssl/private/ssl-cert-snakeoil.key
COPY ssl-cert-snakeoil.pem /etc/ssl/certs/ssl-cert-snakeoil.pem
COPY auth.basic /etc/nginx/
COPY conf.d/ /etc/nginx/conf.d/
