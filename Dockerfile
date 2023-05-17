FROM golang:1.19-alpine AS build
WORKDIR /go/src/proglog
COPY . .
RUN CGO_ENABLED=0 go build -o /go/bin/proglog ./cmd/proglog

RUN GPRC_HEALTH_PROBE_VERSION=v.0.4.8 && \
    wget -q0 /go/bin/grpc_health_probe \
    https://github.com/grpc-exosystem/grpc-health-probe-probe/releases/download/\
${GPRC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-arb64 && \
    chmod +x /go/bin/grpc_health_probe

FROM scratch
COPY --from=build /go/bin/proglog /bin/proglog
COPY --from=build /go/bin/grpc_health_probe /bin/grpc_health_probe
ENTRYPOINT ["/bin/proglog"]

