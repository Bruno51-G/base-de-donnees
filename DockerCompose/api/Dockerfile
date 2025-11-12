FROM golang:1.25.4-alpine3.22

EXPOSE 80
WORKDIR /usr/src/app
CMD [ "/usr/local/bin/app" ]

COPY go.mod go.sum ./
RUN go mod download

COPY . ./
RUN go build -v -o /usr/local/bin/app ./...
