# Use the official Python image.
FROM python:3.10-slim

# Set environment variables to prevent Python from writing .pyc files and buffering stdout/stderr.
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container.
WORKDIR /app

# Install dependencies.
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files into the container.
COPY . /app/

# Expose the default Django port.
EXPOSE 8000

# Command to run the development server.
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
