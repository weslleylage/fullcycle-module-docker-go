FROM golang:alpine AS build
WORKDIR /go/src/app
COPY app.go .
RUN go build -o server app.go

FROM scratch
WORKDIR /go/src/app
COPY --from=build /go/src/app/server .
CMD [ "./server" ]