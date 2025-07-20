FROM ubuntu:noble-20250714
LABEL MAINTAINER="wujidadi@gmail.com"

ARG git_version=2.50.1
ARG vim_version=9.1.1566
ARG nano_great_version=8
ARG nano_version=8.5

ARG root_pswd
ARG user_name=ubuntu
ARG user_pswd

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN echo '' && \
    echo '================================' && \
    echo 'Image building begins ...' && \
    echo '================================' && \
    echo '' && \
    apt-get update && apt-get install -y --no-install-recommends apt-utils && apt-get upgrade -y && \
    echo '' && \
    echo '================================' && \
    echo 'Setting date and timezone ...' && \
    echo '================================' && \
    echo '' && \
    apt-get install -y --no-install-recommends tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    echo '' && \
    echo '================================' && \
    echo 'Installing common packages ...' && \
    echo '================================' && \
    echo '' && \
    apt-get install -y --no-install-recommends sudo bash-completion build-essential openssl libssl-dev libpcre3 \
    libpcre3-dev zlib1g-dev libcurl4-openssl-dev libexpat1-dev tcl gettext net-tools iputils-ping nmap lsof telnet \
    cron rsyslog expect zip unzip p7zip-full curl wget locales zsh apt-transport-https lsb-release ca-certificates \
    less rename tmux sntp tshark gpg gpg-agent gnupg2 && \
    echo '' && \
    echo '================================' && \
    echo 'Setting the locale ...' && \
    echo '================================' && \
    echo '' && \
    sed -i 's/# \(en_US\.UTF-8 .*\)/\1/g' /etc/locale.gen && locale-gen && \
    echo '' && \
    echo '================================' && \
    echo 'Setting root ...' && \
    echo '================================' && \
    echo '' && \
    echo "root:${root_pswd}" | chpasswd && \
    echo '' && \
    echo '==========================================' && \
    echo 'Installing ncurses and S-Lang packages ...' && \
    echo '==========================================' && \
    echo '' && \
    apt-get install -y --no-install-recommends libncursesw5-dev libslang2-dev && \
    echo '' && \
    echo '================================' && \
    echo 'Installing newest Git ...' && \
    echo '================================' && \
    echo '' && \
    curl -L https://github.com/git/git/archive/refs/tags/v${git_version}.tar.gz -o /git.tar.gz && \
    tar xvf /git.tar.gz -C / && cd /git-${git_version} && \
    make prefix=/usr all && make prefix=/usr install && \
    cd / && rm -rf /git-${git_version} /git.tar.gz && \
    echo '' && \
    echo '================================' && \
    echo 'Installing newest Vim ...' && \
    echo '================================' && \
    echo '' && \
    cd / && \
    git clone -b v${vim_version} https://github.com/vim/vim.git vim && \
    cd vim/src && \
    make && make install && \
    cd / && rm -rf vim && \
    echo '' && \
    echo '================================' && \
    echo 'Installing newest GNU Nano ...' && \
    echo '================================' && \
    echo '' && \
    cd / && \
    curl -OL https://www.nano-editor.org/dist/v${nano_great_version}/nano-${nano_version}.tar.xz && \
    tar xvf nano-${nano_version}.tar.xz -C / && cd /nano-${nano_version} && \
    ./configure --enable-utf8 && \
    make && make install && \
    cd .. && rm -rf nano-${nano_version} nano-${nano_version}.tar.xz && \
    echo "include /usr/local/share/nano/*.nanorc" >> /root/.nanorc && \
    echo '' && \
    echo '================================' && \
    echo 'Cleaning apt ...' && \
    echo '================================' && \
    echo '' && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo '' && \
    echo '================================' && \
    echo 'Installing Oh My Zsh ...' && \
    echo '================================' && \
    echo '' && \
    echo Y | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    curl -L https://raw.github.com/Wujidadi/Ubuntu-RC/main/root.bashrc -o /root/.bashrc && \
    curl -L https://raw.github.com/Wujidadi/Ubuntu-RC/main/root.vimrc -o /root/.vimrc && \
    curl -L https://raw.github.com/Wujidadi/Ubuntu-RC/main/root.zshrc -o /root/.zshrc && \
    curl -L https://raw.github.com/Wujidadi/Ubuntu-RC/main/myzshtheme.zsh-theme -o /root/.oh-my-zsh/themes/myzshtheme.zsh-theme && \
    curl -L https://raw.github.com/Wujidadi/Ubuntu-RC/main/myrootzshtheme.zsh-theme -o /root/.oh-my-zsh/themes/myrootzshtheme.zsh-theme && \
    # sed -i 's|^#\s*export PATH=\$HOME/bin:/usr/local/bin:\$PATH|export PATH=\$HOME/bin:/usr/local/bin:/usr/local/sbin:\$PATH|g' /root/.zshrc && \  # No need in Ubuntu based images
    echo '' && \
    echo '=====================================' && \
    echo 'Changing the default shell to Zsh ...' && \
    echo '=====================================' && \
    echo '' && \
    chsh -s /bin/zsh && \
    /bin/bash -c "touch /root/.oh-my-zsh/cache/{.zsh-update,grep-alias}" && \
    echo '' && \
    echo '===============================================================================' && \
    echo "root: Setting Git's default pager to less for displaying unicode characters ..." && \
    echo '===============================================================================' && \
    echo '' && \
    git config --global core.pager 'less --raw-control-chars' && \
    echo '' && \
    echo '================================' && \
    echo 'Configure non-root user ...' && \
    echo '================================' && \
    echo '' && \
    echo "${user_name}:${user_pswd}" | chpasswd && \
    usermod -aG sudo ${user_name} && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/${user_name} && \
    chmod 0440 /etc/sudoers.d/${user_name} && \
    cp /root/.nanorc /home/${user_name}/.nanorc && \
    chown -R ${user_name}:${user_name} /home/${user_name} && \
    echo ''

# Switch to non-root user
USER ${user_name}
RUN echo '=========================================' && \
    echo 'Installing Oh My Zsh to non-root user ...' && \
    echo '=========================================' && \
    echo '' && \
    echo Y | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    curl -L https://raw.github.com/Wujidadi/Ubuntu-RC/main/home.bashrc -o /home/${user_name}/.bashrc && \
    curl -L https://raw.github.com/Wujidadi/Ubuntu-RC/main/home.vimrc -o /home/${user_name}/.vimrc && \
    curl -L https://raw.github.com/Wujidadi/Ubuntu-RC/main/home.zshrc -o /home/${user_name}/.zshrc && \
    sed -i "s|/home/user/.oh-my-zsh|/home/${user_name}/.oh-my-zsh|g" /home/${user_name}/.zshrc && \
    curl -L https://raw.github.com/Wujidadi/Ubuntu-RC/main/myzshtheme.zsh-theme -o /home/${user_name}/.oh-my-zsh/themes/myzshtheme.zsh-theme && \
    curl -L https://raw.github.com/Wujidadi/Ubuntu-RC/main/myrootzshtheme.zsh-theme -o /home/${user_name}/.oh-my-zsh/themes/myrootzshtheme.zsh-theme && \
    echo '' && \
    echo '======================================================' && \
    echo 'Changing the default shell of non-root user to Zsh ...' && \
    echo '======================================================' && \
    echo '' && \
    /bin/bash -c "touch /home/${user_name}/.oh-my-zsh/cache/{.zsh-update,grep-alias}" && \
    echo '' && \
    echo '========================================================================================' && \
    echo "Non-root user: Setting Git's default pager to less for displaying unicode characters ..." && \
    echo '========================================================================================' && \
    echo '' && \
    /bin/bash -c "git config --global core.pager 'less --raw-control-chars'" && \
    echo '' && \
    echo '================================' && \
    echo 'Image building finishes' && \
    echo '================================'

WORKDIR /home/${user_name}

CMD [ "/bin/zsh", "-l" ]
