FROM crystallang/crystal:latest as builder

WORKDIR /opt

RUN \
    apt-get update && \
    apt-get install -y sassc

COPY ./shard.yml ./shard.lock /opt/
RUN shards install -v

COPY . /opt/
RUN make release BE_VERBOSE=true

FROM ubuntu:latest
WORKDIR /
RUN mkdir www
WORKDIR /www
RUN mkdir public

COPY --from=builder /opt/bin/ararusulkanons .
COPY --from=builder /opt/.env .
COPY --from=builder /opt/public ./public/

EXPOSE 3000
EXPOSE 10000

ENTRYPOINT ./ararusulkanons