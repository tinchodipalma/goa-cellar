FROM golang:latest
WORKDIR /go/src/github.com/tinchodipalma/goa-cellar
COPY . .
RUN go get
RUN go build -o goa-cellar
ENTRYPOINT [ "./goa-cellar" ]
