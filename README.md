Proyecto Personal ASIR: Servidor Web Seguro y Automatizado
Parte 1: Servidor Web con Docker
1️⃣ Creación del proyecto
Carpeta del proyecto: Proyecto-de-automatizaci-n-ASIR.
Estructura del proyecto:
Proyecto-de-automatizaci-n-ASIR/
├─ app/www         <-- Archivos web (index.html)
├─ Dockerfile      <-- Para construir la imagen de Apache
├─ httpd.conf      <-- Configuración del servidor Apache
├─ docker-compose.yml
└─ README.md
2️⃣ Configuración de Apache
Imagen utilizada: httpd:2.4-alpine.
Configuración en httpd.conf para escuchar en puerto 8080:
ServerRoot "/usr/local/apache2"
Listen 8080
LoadModule mpm_event_module modules/mod_mpm_event.so
...
<Directory "/usr/local/apache2/htdocs">
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
</Directory>
Problema: Error Invalid command 'Require'.
oSolución: Usar imagen correcta que incluya módulo authz_core.
Ajustes de permisos:
RUN chown -R nobody:nogroup /usr/local/apache2/htdocs \
    && chmod -R 755 /usr/local/apache2/htdocs
3️⃣ Docker Compose
Archivo docker-compose.yml:
services:
  web:
    build: .
    container_name: apache-dev
    ports:
      - "8000:8080"
    volumes:
      - ./app:/usr/local/apache2/htdocs
      - ./httpd.conf:/usr/local/apache2/conf/httpd.conf
Problema: Permission denied: could not create /usr/local/apache2/logs/httpd.pid
oSolución: Ajustar permisos y usuario Apache.
Servidor funcionando en http://localhost:8000.
4️⃣ Comandos importantes
docker-compose build
docker-compose up
docker-compose down
docker ps
docker logs apache-dev
Parte 2: Automatización CI/CD con GitHub
1️⃣ Preparación del repositorio
Proyecto subido a GitHub.
Workflow .github/workflows/ci.yml:
name: CI/CD
on:
  push:
    branches:
      - main
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Log in to GitHub Container Registry
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.GH_USERNAME }}
          password: ${{ secrets.GH_TOKEN }}
      - name: Build and push Docker image
        run: |
          docker build -t ghcr.io/${{ secrets.GH_USERNAME }}/proyecto-asir-apache:latest .
          docker push ghcr.io/${{ secrets.GH_USERNAME }}/proyecto-asir-apache:latest
Problema: Username and password required
oSolución: Añadir secretos GH_USERNAME y GH_TOKEN en GitHub.
2️⃣ Subida de capturas y documentos
Carpeta "Mi primer proyecto (apache,docker)".
Problema: Al arrastrar a WSL desaparecía.
oSolución: Usar rutas de Windows en WSL y copiar:
 cp -r "/mnt/c/Users/HP/Desktop/Mi primer proyecto (apache,docker)" ~/Proyecto-de-automatizaci-n-ASIR/
Añadir y subir a Git:
git add .
git commit -m "Añadir capturas y Word del proyecto"
git push origin main
3️⃣ Resumen de problemas y soluciones
Problema	Solución
Invalid command 'Require' en Apache	Usar imagen correcta con módulo authz_core
Permission denied: could not create /usr/local/apache2/logs/httpd.pid	Ajustar permisos y usuario Apache
GitHub Actions: Username and password required	Añadir secretos GH_USERNAME y GH_TOKEN
Carpeta arrastrada a WSL desaparece	Usar rutas /mnt/c/... y cp -r
git push origin main falla	Confirmar nombre de rama y hacer commit previo
4️⃣ Resultado final
Servidor Apache en Docker funcionando localmente.
CI/CD que construye y sube la imagen al GitHub Container Registry.
Carpeta con capturas y Word subida al repositorio.
README con explicación completa del proceso y errores solucionados.
