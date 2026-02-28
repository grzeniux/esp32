FROM python:3.11-slim

RUN apt-get update && apt-get install -y git
RUN pip install -U platformio

WORKDIR /workspace

COPY . .

CMD ["pio", "run", "-t", "upload"]