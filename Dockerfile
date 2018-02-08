FROM ubuntu:16.04
MAINTAINER Dmitrii Ageev <d.ageev@gmail.com>

# Set environment
ENV APPLICATION "telegram"
ENV VERSION 1.2.6
ENV FILE "tsetup.${VERSION}.tar.xz"
ENV LINK "https://updates.tdesktop.com/tlinux/${FILE}"
ENV EXECUTABLE "/Telegram/Telegram"

# Install software package
RUN apt update
RUN apt install --no-install-recommends -y \
    pulseaudio-utils \
    pavucontrol \
    libcanberra-pulse \
    sudo \
    curl \
    xz-utils

RUN curl -kL -O "${LINK}"
RUN tar xvJf ./${FILE}

# Remove unwanted stuff
RUN rm -f ${FILE}
RUN apt purge -y --auto-remove curl xz-utils

# Copy scripts and pulse audio settings
COPY files/wrapper /sbin/wrapper
COPY files/entrypoint.sh /sbin/entrypoint.sh
COPY files/pulse-client.conf /etc/pulse/client.conf

# Proceed to the entry point
ENTRYPOINT ["/sbin/entrypoint.sh"]
