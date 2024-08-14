FROM rust:latest

RUN apt-get update && apt-get install -y \
    llvm \
    clang \
    libelf-dev \
    linux-headers-generic \
    build-essential \
    pkg-config \
    git

WORKDIR /app

COPY . .

RUN cargo build

CMD ["cargo", "run"]