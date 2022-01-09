FROM ubuntu:focal
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update && \
apt install lsb-release wget software-properties-common -y && \
add-apt-repository ppa:ubuntu-toolchain-r/test && \
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
add-apt-repository "deb http://apt.llvm.org/focal/ llvm-toolchain-focal main" && \
apt update && apt upgrade -y && \
apt install bc binutils-dev u-boot-tools bison build-essential \
ca-certificates ccache clang cmake curl ninja-build file flex \
patchelf clang lld git libelf-dev libssl-dev make python3-dev \
texinfo xz-utils zlib1g-dev -y && \
apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
rm -rf /var/lib/apt/lists/*
ENV SHELL="bash"
ENV TZ="Asia/Jakarta"
ENV HOME="/root"
CMD ["bash"]
