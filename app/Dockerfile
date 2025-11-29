FROM httpd:2.4-alpine

WORKDIR /usr/local/apache2

# Copiamos la configuración y el sitio web
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY www/ /usr/local/apache2/htdocs/

# Permisos para usuario nobody
RUN chown -R nobody:nogroup /usr/local/apache2/htdocs \
    && chmod -R 755 /usr/local/apache2/htdocs
RUN mkdir -p /usr/local/apache2/logs \
    && chown -R www-data:www-data /usr/local/apache2/logs

EXPOSE 8080

# Ejecutar

CMD ["httpd", "-D", "FOREGROUND", "-f", "/usr/local/apache2/conf/httpd.conf"]
