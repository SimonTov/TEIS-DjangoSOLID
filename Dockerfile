# 1. Imagen base oficial de Python ligera
FROM python:3.12-slim

# 2. Evitamos archivos .pyc y buffer de logs
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 3. Directorio de trabajo dentro del contenedor
WORKDIR /app

# 4. Copiamos e instalamos dependencias
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copiamos el resto del código
COPY . /app/

# 6. Comando por defecto al iniciar
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]