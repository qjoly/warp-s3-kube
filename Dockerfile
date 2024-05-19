FROM debian:bookworm-20240513

ENV WARP_VERSION v0.9.0
ENV ARCH x86_64

WORKDIR /app

RUN apt update && \
    apt install -y wget
RUN wget https://github.com/minio/warp/releases/download/${WARP_VERSION}/warp_Linux_${ARCH}.deb && \
    dpkg -i warp_Linux_${ARCH}.deb &&  \
    rm warp_Linux_${ARCH}.deb

COPY ./entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]


