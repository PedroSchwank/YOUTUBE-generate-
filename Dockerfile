# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.9-slim

# These two environment variables are used by Apify to set up the actor.
ENV APIFY_DEFAULT_KEY_VALUE_STORE_ID default
ENV APIFY_MEMORY_MBYTES 2048

# Show where we are in the container
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install any needed packages specified in requirements.txt
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code into the container
COPY . ./

# Run the main script when the container starts
CMD ["python", "./main.py"]
