# Dockerfile for chatbot app
FROM python:3.9-slim

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy chatbot and flask app files
COPY . /app/

# Expose the port on which the app will run
EXPOSE 5000

# Start the Flask app
CMD ["python", "web_chatbot.py"]
