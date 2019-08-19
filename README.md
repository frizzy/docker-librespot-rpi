# docker-librespot-rpi
Docker image for [Librespot](https://github.com/librespot-org/librespot) (Open Source [Spotify](https://www.spotify.com) client library) for Raspberry Pi

### Examples

Get Librespot options:

    docker run --rm frizzy/librespot-rpi:latest --help

Use with [Snapcast](https://github.com/badaix/snapcast):

    docker run -d \
        --restart=always \
        --name="Spotify" \
        --read-only \
        --mount type=tmpfs,destination=/tmp \
        -v /tmp/snapfifo:/fifo \
        frizzy/librespot-rpi:latest \
        -n "Living room"
        -u <user> \
        -p <password> \
        --disable-audio-cache \
        --enable-volume-normalisation \
        --linear-volume \
        --initial-volume=50 \
        --bitrate 320 \
        --backend pipe --device /fifo
        
