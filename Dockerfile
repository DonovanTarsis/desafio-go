FROM golang:alpine AS first-build

WORKDIR /usr/src/app/go/

COPY ./go/ .

RUN go build -o ./main

FROM scratch

COPY --from=first-build /usr/src/app/go/main .

ENTRYPOINT [ "./main" ]
