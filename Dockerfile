FROM python:3.11-slim

# Install only the flashing tool
RUN pip install --no-cache-dir esptool

WORKDIR /flash

# Set esptool as the entrypoint
ENTRYPOINT ["esptool.py"]