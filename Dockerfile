FROM python:3.13-slim

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

# Copy dependency manifest first for better layer caching
COPY pyproject.toml /app/
RUN uv sync --no-dev

# Copy the rest of the source
COPY . /app
RUN uv sync --no-dev

ENV PYTHONUNBUFFERED=1

EXPOSE 8080

CMD ["uv", "run", "main.py"]