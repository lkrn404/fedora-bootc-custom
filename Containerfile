FROM quay.io/fedora/fedora-bootc:44

RUN dnf install -y \
vim \
git \
curl \
tmux \
NetworkManager \
openssh-server \
fastfetch

# Copy build scripts and configuration
COPY sysmods/ /tmp/build/sysmods/
COPY config/ /tmp/build/config/

# System config modules to enable
RUN bash /tmp/build/sysmods/01-firewalld.sh
RUN bash /tmp/build/sysmods/02-swap-on-zram.sh
#RUN bash /tmp/build/sysmods/example-disabled-thing.sh

RUN systemctl enable NetworkManager.service
RUN systemctl enable sshd.service

# Remove build-time files
RUN rm -rf /tmp/build
RUN dnf clean all

# Check - need to address problems before fatal warnings enabled
#RUN bootc container lint --fatal-warnings
RUN bootc container lint
