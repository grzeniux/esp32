FROM python:3.11-slim

# Install only the light flashing tool
RUN pip install --no-cache-dir esptool

WORKDIR /flash