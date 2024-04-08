FROM alpine:3.19

RUN apk add --no-cache build-base git

WORKDIR /app
COPY * .

RUN make

FROM alpine:3.19

WORKDIR /app
COPY --from=0 /app/mdns-repeater .
CMD ["/app/mdns-repeater"]
