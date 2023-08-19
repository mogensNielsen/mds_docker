FROM meltano/meltano

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN apt update \
&& apt install -y \
curl \
&& rm -rf /var/lib/apt/lists/*

ARG PROJECT=mds_docker_box
ARG MELTANO_PROJ_ROOT=project
RUN meltano init ${PROJECT}

WORKDIR /${MELTANO_PROJ_ROOT}/${PROJECT}

EXPOSE 5000