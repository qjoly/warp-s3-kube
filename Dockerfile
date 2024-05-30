FROM golang:1.22 as builder

ENV WARP_VERSION=0.9.0

WORKDIR /go/src/github.com/minio/warp/
RUN git clone --depth 1 --branch "v$WARP_VERSION" https://github.com/minio/warp .

RUN go mod download

ENV CGO_ENABLED=0

RUN go build -ldflags '-w -s' -a -o warp .

FROM debian:bookworm-20240513

COPY --from=builder /go/src/github.com/minio/warp/warp /usr/local/bin/warp

WORKDIR /app

ENV KEEP_ALIVE_AFTER_TEST=true

COPY ./entrypoint.sh /app/entrypoint.sh
COPY ./bulk.sh /app/bulk.sh

RUN chmod +x /app/entrypoint.sh && \
    chmod +x /app/bulk.sh

CMD ["/app/entrypoint.sh"]


