from ubuntu:18.04

run apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    snapcraft \
    tzdata \
    && apt-get -y clean

# Included only because it is installed in the snapcraft but apprently
# that doesn't happen non-interactively so the build hangs.
run apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    tzdata \
    && apt-get -y clean

# These are just here to speed up the build so that snapcraft won't redo them all.
# Costs a bit of disk space for the docker image though.
run apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    cmake \
    g++ \
    libevdev-dev \
    libopencv-dev \
    libprocps-dev \
    make \
    pkg-config \
    qtbase5-dev \
    qttools5-dev \
    qttools5-dev-tools \
    && apt-get -y clean

env LC_ALL=C.UTF-8
env SNAPCRAFT_SETUP_CORE 1

volume /mnt/opentrack
# TODO replace above with git clone (or build arg parameterize it)
workdir /mnt/opentrack/snap
cmd snapcraft snap --enable-geoip
