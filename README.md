# pycharm

Docker container to run [PyCharm](https://www.jetbrains.com/pycharm) - Python IDE for Professional Developers

# Usage

The wrapper scripts volume mount the X11 and pulseaudio sockets in the launcher container. The X11 socket allows for the user interface display on the host, while the pulseaudio socket allows for the audio output to be rendered on the host.

When the image is launched the following directories are mounted as volumes

    Container		Host
--------------------------------------------
    ${HOME}/.pycharm	~/.pycharm
    ${HOME}/.config	~/.pycharm/.config
    ${HOME}/.local	~/.pycharm/.local
    ${HOME}/.pki	~/.pycharm/.pki
    ${HOME}/Downloads	~/Downloads

This makes sure that your profile details are stored on the host and files received are available on your host in the appropriate download directory.

To launch Pycharm in a container use the wrapper script. For example, after installation pycharm command will launch Pycharm inside a Docker container regardless of whether it is installed on the host or not.


# Installation

With the image locally available, install the wrapper scripts using:

```
docker run -it --rm --volume ~/bin/:/target dmitriiageev/pycharm install
```

This will install a wrapper script to launch pycharm.


# Uninstallation

```
docker run -it --rm --volume ~/bin:/target dmitriiageev/pycharm uninstall
```

# Note

This docker image supports audio playback with PULSEAUDIO through a runtime dir mount.

GitHub Page: https://github.com/dmitrii-ageev/pycharm
Docker Hub Page: https://hub.docker.com/r/dmitriiageev/pycharm
