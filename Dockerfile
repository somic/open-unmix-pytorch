FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime

RUN apt-get update && apt-get install -y --no-install-recommends \
    libsox-fmt-all \
    sox \
    libsox-dev

WORKDIR /workspace

COPY *.py /workspace

RUN conda install tqdm=4.32 ffmpeg resampy -c conda-forge

RUN pip install 'musdb==0.3.1' 'norbert>=0.2.0' 'museval==0.3.0'
