# telegram
Docker container to run Telegram - text, voice and video communication software.

# Usage
```
#!/bin/bash
docker run -it --rm --name telegram -h docker \
       --cpuset-cpus 0 --memory 2048mb --net host \
       -e DISPLAY=$DISPLAY \
       --device /dev/dri:/dev/dri \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /etc/machine-id:/etc/machine-id \
       -v $XDG_RUNTIME_DIR/pulse:$XDG_RUNTIME_DIR/pulse \
       dmitriiageev/telegram
```

GitHub Page: https://github.com/dmitrii-ageev/telegram
Docker Hub Page: https://hub.docker.com/r/dmitriiageev/telegram

# Note
This docker image supports audio playback with PULSEAUDIO through a runtime dir mount.
