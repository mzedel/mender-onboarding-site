FROM busybox
RUN mkdir '/www'
WORKDIR /www
COPY . .
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/www/entrypoint.sh" ]