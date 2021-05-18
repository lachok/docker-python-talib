# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.9-slim

# Install curl and compilers
RUN apt-get update && apt-get install -y curl build-essential

# Download ta-lib
WORKDIR /tmp/talib-install
RUN curl -LOC - https://netcologne.dl.sourceforge.net/project/ta-lib/ta-lib/0.4.0/ta-lib-0.4.0-src.tar.gz
RUN tar -xzf ta-lib-0.4.0-src.tar.gz

# Compile and install ta-lib
WORKDIR /tmp/talib-install/ta-lib
RUN ./configure --prefix=/usr
RUN make
RUN make install
RUN rm -rf /tmp/talib-install

CMD "python"
