FROM python:3.9-slim

WORKDIR /app

RUN groupadd -g 1000 server && useradd -r -u 1000 -g server server

COPY . .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

RUN chown -R server:server /app

USER 1000

ENV PORT=80

ENV HOST=0.0.0.0

CMD ["fastapi", "run", "main.py"]