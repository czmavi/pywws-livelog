# Pywws docker image

Provides a [Docker image](https://hub.docker.com/r/czmavi/pywws-livelog) with [pywws](https://github.com/jim-easterbrook/pywws)

## Run

`docker run -v ~/mylocalfoldertostoredata/:/var/data --privileged czmavi/pywws-livelog`

The `--privileged` setting is required for accessing USB devices.

## Usage

For the first time when you don't have existing `weather.ini` running this container will exit. Then add your specific settings to `weather.ini` which was just created and run it again. This time the livelog command will be started and the container will continue to run.