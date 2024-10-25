# LLamamos a la imagen ubuntu
FROM ubuntu:latest

# Crea una nueva capa a la image es lo que sirve el run y lo demas actualizamos repositorios
RUN apt-get update && \
# Instalamos apache y mysql 
    apt-get install -y apache2 mysql-server && \
# Elimina todos los archivos .deb que ya no son necesarios
    apt-get clean


# Exponer los puertos 80 para Apache y 3306 para MySQL
EXPOSE 80
EXPOSE 3306


# Estos comandos se ejecutarán cada vez que se inicie el contenedor El CDM se ejecutara cuando el contenedor este arriba
#Esto sucede por defecto
CMD service apache2 start && \
#Iniciamos los servicio
    service mysql start && \
#Este comando sirve para que el contenedor siga corriendo en segundo plano
    tail -f /dev/null