FROM golang:1.17.3-alpine3.14 AS builder
WORKDIR /builder
ENV GO111MODULE=on CGO_ENABLED=0
COPY . .
RUN go build full-cycle-rocks.go

FROM scratch
WORKDIR /app
COPY --from=builder /builder/full-cycle-rocks .
EXPOSE 8000
CMD [ "./full-cycle-rocks" ]