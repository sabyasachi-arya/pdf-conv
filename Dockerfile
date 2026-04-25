FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV HOME=/root

RUN apt-get update && apt-get install -y \
    libreoffice \
    libreoffice-writer \
    libreoffice-calc \
    libreoffice-impress \
    poppler-utils \
    fonts-liberation \
    fonts-dejavu-core \
    fonts-freefont-ttf \
    fonts-crosextra-carlito \
    fonts-crosextra-caladea \
    fontconfig \
    && fc-cache -f -v \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "1", "--timeout", "180", "app:app"]
