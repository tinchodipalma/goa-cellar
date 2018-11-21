# goa-cellar Builder Stage
FROM golang:1-alpine AS builder
WORKDIR /go/src/github.com/tinchodipalma/goa-cellar
COPY . .
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
RUN go get
RUN GOOS=linux GOARCH=amd64 go build -o goa-cellar

# goa-cellar Runner Stage
FROM alpine AS runner
WORKDIR /app/
COPY --from=builder /go/src/github.com/tinchodipalma/goa-cellar/goa-cellar .
ENTRYPOINT [ "./goa-cellar" ]
