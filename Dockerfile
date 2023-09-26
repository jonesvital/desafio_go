FROM golang:1.21.1-alpine3.17 as build

WORKDIR /app

COPY hello-world.go /app
RUN go build -ldflags="-s -w" hello-world.go

FROM scratch as main

COPY --from=build /app/hello-world hello-world
ENTRYPOINT ["./hello-world"]