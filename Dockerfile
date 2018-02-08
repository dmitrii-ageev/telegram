FROM ubuntu:16.04
MAINTAINER Dmitrii Ageev <d.ageev@gmail.com>

# Set environment
ENV UNAME telegram

ENV VERSION 1.2.6
ENV FILE "tsetup.${VERSION}.tar.xz"
ENV LINK "https://updates.tdesktop.com/tlinux/${FILE}"

# Install software package
RUN apt update
RUN apt install --no-install-recommends -y \
    pulseaudio-utils \
    pavucontrol \
    libcanberra-pulse \
    curl \
    xz-utils

RUN curl -kL -O "${LINK}"
RUN tar xvJf ./${FILE}

# Remove unwanted stuff
RUN rm -f ${FILE}
RUN apt purge -y --auto-remove curl xz-utils

# Copy pulse audio settings
COPY files/pulse-client.conf /etc/pulse/client.conf

# Create a user
RUN groupadd -g 1000 $UNAME
RUN useradd -u 1000 -g 1000 -G audio,video -m $UNAME

# Run a software
USER $UNAME

ENV PULSE_LATENCY_MSEC 30
CMD /Telegram/Telegram
