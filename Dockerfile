# Python version
FROM python:3.12-slim

# working directory
WORKDIR /app

# copyting the current directory contents into the container at /app
COPY . /app

# Install the needed packages and libraries specified in the requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1



# Run the commande to start Gunicorn
CMD ["gunicorn", "real_estate.wsgi:application", "--bind", "0.0.0.0:8000" ]