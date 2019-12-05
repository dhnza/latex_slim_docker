FROM ubuntu:18.04
MAINTAINER dhna

# Add latest Tex Live PPA
RUN apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends -y gnupg && \
    # Add sources
    echo "deb http://ppa.launchpad.net/jonathonf/texlive/ubuntu bionic main " >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4AB0F789CBA31744CC7DA76A8CF63AD3F06FC659 && \
    apt-get autoremove -y && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*

# Install TexLive and other utilities
RUN apt-get update && \
    # texlive-latex-extra settings
    echo "12\n9\n" | \
    apt-get install --no-install-suggests --no-install-recommends -y \
        # TeX Live essentials
        texlive-base \
        texlive-xetex \
        # Utilities
        make \
        latexmk \
        wget \
        && \
    apt-get autoremove -y && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*

# Initialize tlmgr to allow installing other packages
RUN tlmgr init-usertree && \
    tlmgr update --all
