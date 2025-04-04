FROM node:11.2.0

RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i '/stretch-updates/d' /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y git tmux python3 python3-pip
RUN apt-get clean

# rm -rf /var/lib/apt/lists/* && \  this is optional 

WORKDIR /app
COPY requirements.txt /app/requirements.txt
COPY sync.py /app/sync.py
COPY sync.sh /app/sync.sh
COPY start.sh /app/start.sh
RUN chmod +x /app/sync.sh /app/start.sh
CMD ["/app/start.sh"]

