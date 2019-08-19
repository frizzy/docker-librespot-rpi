FROM arm32v7/debian:buster-slim

RUN apt update
RUN apt install -y apt-utils
RUN apt upgrade -y
RUN apt install -y build-essential libasound2-dev cargo libsdl2-dev
RUN apt install -y git

WORKDIR /

RUN git clone https://github.com/librespot-org/librespot.git
RUN cd /librespot && cargo build --release
RUN mv /librespot/target/release/librespot /usr/local/bin
RUN apt remove --purge -y cargo build-essential git libasound2-dev libsdl2-dev apt-utils
RUN apt install -y libunwind8
RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/local/bin/librespot" ]
