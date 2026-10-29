FROM quay.io/fedora/fedora-bootc:44

RUN dnf install -y \
vim \
git \
curl \
tmux \
NetworkManager \
openssh-server \
&& dnf clean all

RUN systemctl enable NetworkManager.service
RUN systemctl enable sshd.service

# Check
RUN bootc container lint
