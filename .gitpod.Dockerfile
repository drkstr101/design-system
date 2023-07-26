FROM gitpod/workspace-full-vnc

ENV CYPRESS_CACHE_FOLDER=/workspace/.cypress-cache

# Install Cypress dependencies.
RUN sudo apt-get update \
  && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  libgtk2.0-0 \
  libgtk-3-0 \
  libnotify-dev \
  libgconf-2-4 \
  libnss3 \
  libxss1 \
  libasound2 \
  libxtst6 \
  xauth \
  xvfb \
  && sudo rm -rf /var/lib/apt/lists/*

# Install github cli
RUN type -p curl >/dev/null || (sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt install curl -y)
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo DEBIAN_FRONTEND=noninteractive apt install gh -y \
  && sudo rm -rf /var/lib/apt/lists/*

USER gitpod

# Setup dev env
RUN npm install --global npm pnpm && \
  SHELL=bash npx @teambit/bvm@latest install && \
  echo >> ${HOME}/.bashrc && \
  echo 'export PATH=$PATH:node_modules/.bin' >> ${HOME}/.bashrc
