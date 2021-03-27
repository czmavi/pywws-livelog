ARG VERSION=3.12.5
FROM alpine:$VERSION
ENV RESET=5

VOLUME ["/var/data"]

RUN apk update
RUN apk upgrade

RUN apk add --no-cache python3 \
    libusb \
    py3-cffi \
    openssl \
    libc-dev \
    ca-certificates \
    python3-dev \
    py3-pytest \
    gcc \
    py3-cryptography \
    py3-paramiko \
    gnuplot \
    py3-pip \
    && update-ca-certificates

RUN pip3 install --upgrade pip
RUN pip3 install \
    libusb1 \
    tzlocal \
    pycrypto \
    paho-mqtt \
    pywws

CMD if [[ -f "/var/data/weather.ini" ]] ; then echo "weather.ini already exists" ; else python3 -m pywws.logdata -vvv /var/data; fi && echo "Setting refresh interval to ${RESET}" && pywws-setweatherstation -r $RESET && pywws-livelog -vvv /var/data
