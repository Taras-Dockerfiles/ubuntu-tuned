FROM ubuntu:24.04
LABEL MAINTAINER="wujidadi@gmail.com"

ARG vim_tag=v9.1.1077
ARG nano_great_version=8
ARG nano_version=8.3

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
    apt-get install -y --no-install-recommends sudo expect bash-completion build-essential openssl libssl-dev net-tools \
    iputils-ping nmap lsof telnet cron rsyslog zip unzip p7zip-full curl wget locales git zsh gosu apt-transport-https \
    lsb-release ca-certificates less rename screen sntp tshark gpg gpg-agent gnupg2 software-properties-common && \
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
    echo 'root:RootUser' | chpasswd && \
    echo '' && \
    echo '=============================================' && \
    echo 'Installing apt software-properties-common ...' && \
    echo '=============================================' && \
    echo '' && \
    apt-get install -y --no-install-recommends software-properties-common && \
    echo '' && \
    echo '==========================================' && \
    echo 'Installing ncurses and S-Lang packages ...' && \
    echo '==========================================' && \
    echo '' && \
    apt-get install -y --no-install-recommends libncursesw5-dev libslang2-dev && \
    echo '' && \
    echo '================================' && \
    echo 'Installing newest Vim ...' && \
    echo '================================' && \
    echo '' && \
    cd / && \
    git clone -b ${vim_tag} https://github.com/vim/vim.git vim && \
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
    echo 'Image building finishes' && \
    echo '================================'

CMD [ "/bin/zsh", "-l" ]
