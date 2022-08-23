FROM condaforge/mambaforge:latest

# For opencontainers label definitions, see:
#    https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.title="edlfs"
LABEL org.opencontainers.image.description="An fsspec back-end that supports NASA's Earthdata Login (EDL)"
LABEL org.opencontainers.image.vendor="NASA-Openscapes"
LABEL org.opencontainers.image.authors="Luis Lopez <betolin@gmail.com>, Joseph H. Kennedy <me@jhkennedy.org>"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.url="https://github.com/NASA-Openscapes/edlfs"
LABEL org.opencontainers.image.source="https://github.com/NASA-Openscapes/edlfs"
LABEL org.opencontainers.image.documentation="https://github.com/NASA-Openscapes/edlfs"

ARG DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE=true

RUN apt-get update && apt-get install -y --no-install-recommends unzip vim && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ARG CONDA_UID=1000
ARG CONDA_GID=1000

RUN groupadd -g "${CONDA_GID}" --system conda && \
    useradd -l -u "${CONDA_UID}" -g "${CONDA_GID}" --system -d /home/conda -m  -s /bin/bash conda && \
    chown -R conda:conda /opt && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> /home/conda/.profile && \
    echo "conda activate base" >> /home/conda/.profile

USER ${CONDA_UID}
SHELL ["/bin/bash", "-l", "-c"]
WORKDIR /home/conda/

COPY --chown=${CONDA_UID}:${CONDA_GID} . /edlfs/

RUN mamba env create -f /edlfs/environment.yml && \
    conda clean -afy && \
    conda activate edlfs && \
    sed -i 's/conda activate base/conda activate edlfs/g' /home/conda/.profile && \
    python -m pip install --no-cache-dir /edlfs

ENTRYPOINT ["/usr/bin/bash"]
CMD ["-l"]
