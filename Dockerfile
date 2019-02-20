FROM debian:stretch-slim

RUN apt-get -qq -y update && \
	apt-get -y install apache2 && \
	rm -r /var/log/apt/* /var/cache/apt/archives/ /usr/share/doc/ /usr/share/man /var/www/html/index.html && \
	ln -sf /dev/stdout /var/log/apache2/access.log && \ 
        ln -sf /dev/stderr /var/log/apache2/error.log 

EXPOSE 80
	
COPY ./html/ /var/www/html/

ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
