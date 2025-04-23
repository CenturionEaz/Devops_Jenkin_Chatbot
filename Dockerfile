# Use official Python image
FROM python:3.10

# Set work directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose Flask default port
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=web_chatbot.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

# Run Flask app
CMD ["flask", "run"]
