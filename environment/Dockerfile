# hash:sha256:d4a38a1f33a71c8f27f30dd1b47a61098244399e650477baa3f4442ef2735921
FROM registry.apps.codeocean.com/codeocean/mambaforge3:22.11.1-4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN mamba install -y --channel=defaults --channel=bioconda --channel=conda-forge \
        kallisto==0.50.0 \
    && mamba clean -ya

RUN pip install -U --no-cache-dir \
    code-ocean-aux-tools==1.1.2

COPY postInstall /
RUN /postInstall
