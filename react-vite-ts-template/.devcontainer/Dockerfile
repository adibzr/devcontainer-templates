# Use the TypeScript & Node.js devcontainer image as a base.
FROM mcr.microsoft.com/devcontainers/typescript-node:latest

# [Optional] Install common utilities
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
    nano \
    vim \
    wget \
    curl \
    git \
    unzip \
    htop \
    python3 \
    python3-pip \
    gnupg2 \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

# [Optional]  Install zsh
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends zsh

# [Optional] Switch to zsh shell on startup (Optional, remove if you don't want zsh)
RUN chsh -s /usr/bin/zsh vscode

# [Optional] Example: Install a specific version of Node.js using nvm
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install node"

# [Optional] Install global npm packages
RUN npm install -g npm@latest \
    typescript@latest \
    ts-node@latest

# [Optional]  Customize the environment
ENV EDITOR="vim"
ENV SHELL="/usr/bin/zsh" 

# [Optional] Example: Copy local files to the container.
# COPY ./my-local-scripts /home/vscode/my-local-scripts/

# [Optional] Example: Add a non-root user.
# ARG USER_ID=1000
# ARG GROUP_ID=1000
# RUN adduser --disabled-password --gecos "" --uid ${USER_ID} vscode
# RUN addgroup --gid ${GROUP_ID} vscode
# RUN usermod -aG sudo vscode
# USER vscode

# [Optional] Use a specific port for your application if needed.
# EXPOSE 3000

# [Optional]  Install Oh-My-Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

# [Optional]  Install Powerlevel10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# [Optional] Setup Powerlevel10k
RUN echo 'source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
RUN echo 'POWERLEVEL9K_MODE="nerdfont-complete"' >> ~/.zshrc  # Add this line for Nerdfont support
RUN echo 'POWERLEVEL9K_PROMPT_ON_NEW_LINE=true' >> ~/.zshrc
RUN echo 'POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)' >> ~/.zshrc # Display directory and Git status
RUN echo 'POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)' >> ~/.zshrc # Display status and time

# [Optional] Install any other ZSH plugins you want (e.g., zsh-autosuggestions)
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN echo 'plugins+=(zsh-autosuggestions)' >> ~/.zshrc
RUN echo 'HIST_STAMPS="yyyy-mm-dd {HH:MM:SS}"' >> ~/.zshrc

# [Optional] Add alias to .zshrc
RUN echo 'alias ls="ls -lah --color=auto"' >> ~/.zshrc

# Clean up apt cache to reduce image size
RUN apt-get autoremove -y && apt-get clean -y