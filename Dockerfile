# Docker file to create a webserver rendering string of latex document/piece and return a png file

FROM texlive/texlive

RUN apt-get update && \ 
    apt-get install -y --no-install-recommends \
    poppler-utils \
    vim \
    python3-pip \
    python3-venv && \
    python3 -m venv /root/venv && \
    /root/venv/bin/pip install --upgrade pip && \
    /root/venv/bin/pip install tornado

RUN mkdir -p /root/latex
WORKDIR /root/latex/
COPY . .

EXPOSE 8123

CMD ["/root/venv/bin/python", "xe-latex-server.py"]
