FROM quay.io/fedora/fedora-bootc:44

RUN dnf install -y \
vim \
git \
curl \
tmux \
NetworkManager \
openssh-server \
fastfetch \
&& dnf clean all

# Copy build scripts and configuration
COPY sysmods/ /tmp/build/sysmods/
COPY config/ /tmp/build/config/

RUN bash /tmp/build/sysmods/zram.sh

RUN systemctl enable NetworkManager.service
RUN systemctl enable sshd.service

# Remove build-time files
RUN rm -rf /tmp/build

# Check
RUN bootc container lint
