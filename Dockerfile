FROM golang:1-alpine
WORKDIR /go/src/github.com/tinchodipalma/goa-cellar
COPY . .
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
RUN go get
RUN go build -o goa-cellar
ENTRYPOINT [ "./goa-cellar" ]
