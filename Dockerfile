FROM debian:stretch-slim

RUN apt-get -qq -y update && \
	apt-get -y install apache2 && \
	rm -r /var/log/apt/* /var/cache/apt/archives/ /usr/share/doc/ /usr/share/man /var/www/html/index.html

EXPOSE 80
	
COPY ./html/ /var/www/html/

ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
