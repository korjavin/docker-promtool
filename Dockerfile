FROM golang:1.15 as promtool

RUN go get github.com/prometheus/prometheus/cmd/promtool

FROM python

RUN apt update
RUN apt install -y jq
RUN pip3 install yq

COPY --from=0 /go/bin/promtool /

ENTRYPOINT "/bin/bash"



