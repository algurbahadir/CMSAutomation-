# Use the official Python image as the base image
FROM python:3.9

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Run database migrations
RUN python manage.py makemigrations
RUN python manage.py migrate

# Collect static files
RUN python manage.py collectstatic --noinput

# Start Gunicorn and serve the Django app
CMD ["gunicorn", "PyEditorial.wsgi:application", "--bind", "0.0.0.0:8000"]
