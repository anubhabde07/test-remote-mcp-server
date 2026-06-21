FROM python:3.11-slim

WORKDIR /app

# Install uv

RUN pip install uv

# Copy project files

COPY . .

# Install dependencies from pyproject.toml

RUN uv sync

EXPOSE 8080

CMD ["uv", "run", "python", "main.py"]
