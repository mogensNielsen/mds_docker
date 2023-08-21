FROM ubuntu:latest

RUN apt update \
  && apt install -y \
  curl \
  python3-pip \
  python3-venv \
  git \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN pip3 install pipx

ENV PATH="/root/.local/bin:${PATH}"

RUN pipx install meltano

ARG PROJECT=mds_docker_box
ARG MELTANO_PROJ_ROOT=project
WORKDIR /${MELTANO_PROJ_ROOT}/${PROJECT}
RUN meltano init ${PROJECT}

# This doesn't do anything at the moment because nothing is running on that port
#EXPOSE 5000
