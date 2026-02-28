# Use a lightweight Python image as the base
FROM python:3.11-slim

# Install system dependencies and clean up apt cache to keep the image small
RUN apt-get update && apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Install PlatformIO Core without keeping the pip cache
RUN pip install --no-cache-dir -U platformio

# Define build arguments for user and group IDs to match the host machine [cite: 2026-02-11]
ARG USER_ID=1000
ARG GROUP_ID=1000

# Create a dedicated user and group for PlatformIO to avoid permission conflicts [cite: 2026-02-11]
RUN groupadd -g $GROUP_ID pio_group && \
    useradd -l -u $USER_ID -g pio_group -m pio_user

# Switch to the non-root user for security and file ownership consistency [cite: 2026-02-11]
USER pio_user

# Set the working directory inside the container
WORKDIR /workspace

# Set the entrypoint to the PlatformIO CLI
ENTRYPOINT ["pio"]

# Default command to compile and upload the firmware
CMD ["run", "-t", "upload"]