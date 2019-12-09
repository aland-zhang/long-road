# Builder image
FROM golang:1.12-alpine as builder

RUN apk add --no-cache \
    wget \
    make \
    git \
    gcc \
    musl-dev

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 \
 && chmod +x /usr/local/bin/dumb-init

RUN mkdir -p /go/src/github.com/pingcap/tidb-tools
WORKDIR /go/src/github.com/pingcap/tidb-tools

# Cache dependencies
COPY go.mod1 go.mod
COPY go.sum1 go.sum

RUN GO111MODULE=on go mod download

# Build real binaries
COPY . .
RUN make sync_diff_inspector

# Executable image
FROM alpine

COPY --from=builder /go/src/github.com/pingcap/tidb-tools/bin/sync_diff_inspector /sync_diff_inspector
COPY --from=builder /usr/local/bin/dumb-init /usr/local/bin/dumb-init

WORKDIR /

#ENTRYPOINT ["/usr/local/bin/dumb-init", "/sync_diff_inspector"]
