FROM python:3.10-slim

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos todo el contenido de la carpeta local al contenedor
COPY . .

# Instalamos las dependencias
RUN pip install flask

# Exponemos el puerto donde Flask corre
EXPOSE 5000

# Comando para ejecutar la app
CMD ["python", "app.py"]
