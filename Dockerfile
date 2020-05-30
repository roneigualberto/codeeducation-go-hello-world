FROM golang:1.11-alpine AS build

WORKDIR /app

COPY . /app

RUN go build main.go

FROM scratch

COPY --from=build /app/main /app/main


ENTRYPOINT [ "/app/main" ]

