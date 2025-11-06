# Stage 1: Builder
FROM python:3.10-slim AS build
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Final image (use SAME base image family)
FROM python:3.10-slim
WORKDIR /app
COPY --from=build /usr/local/lib/python3.10 /usr/local/lib/python3.10
COPY inventory-api/ ./inventory-api/
EXPOSE 5000
CMD ["python", "inventory-api/app.py"]
