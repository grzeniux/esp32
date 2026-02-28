FROM python:3.11-slim

# Install only the necessary flashing tool
RUN pip install --no-cache-dir esptool

WORKDIR /flash