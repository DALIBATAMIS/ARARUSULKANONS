FROM crystallang/crystal:1.12.1 as builder

WORKDIR /opt

RUN \
    apt-get update && \
    apt-get install -y sassc

COPY ./shard.yml ./shard.lock /opt/
RUN shards install -v

COPY . /opt/
RUN make release BE_VERBOSE=true

RUN ls bin

FROM alpine:latest
WORKDIR /
COPY --from=builder /opt/bin/ararusulkanons .

ENTRYPOINT bash start.sh