# mi-app-aws1 🚀

Aplicación web en Python/Flask, contenedorizada con Docker y desplegada en AWS EC2.

## Descripción

- Endpoints: `/`, `/health`, `/info`
- Docker para contenerización
- Despliegue en AWS EC2
- Control de versiones con GitHub

## Cómo ejecutar localmente

```bash
git clone https://github.com/jorgemg7/Proyecto-de-automatizaci-n-ASIR-.git
cd mi-app-aws1
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python app.py
