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

RUN bash /tmp/build/sysmods/zram.sh

RUN systemctl enable NetworkManager.service
RUN systemctl enable sshd.service

# Remove build-time files
RUN rm -rf /tmp/build
RUN dnf clean all

# Check - need to address problems before fatal warnings enabled
#RUN bootc container lint --fatal-warnings
RUN bootc container lint
