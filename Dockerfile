FROM python:3.11-slim

# Install the flashing tool
RUN pip install --no-cache-dir esptool

ENTRYPOINT []

WORKDIR /flash