FROM ubuntu:latest
MAINTAINER dhna

COPY texlive.profile texlive.profile

# Install TexLive
RUN apt-get update && \
    # Dependencies and Utilities
    apt-get install --no-install-suggests --no-install-recommends -y \
        gnupg libfontconfig perl python make wget && \
    # Download installer
    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -zxvf install-tl-unx.tar.gz && \
    rm install-tl-unx.tar.gz && \
    # Install TexLive
    cd install-tl*/ && \
    ./install-tl --profile=/texlive.profile && \
    # spell checker
    apt-get install --no-install-suggests --no-install-recommends -y \
    aspell aspell-en python3-proselint python3-pkg-resources && \
    # Clean up
    cd / && rm -rf install-tl* && \
    apt-get autoremove -y && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/local/texlive/2019/bin/x86_64-linux:${PATH}"
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ADD spell_check.sh /spell_check.sh

# Install tlmgr packages
RUN tlmgr update --self && \
    tlmgr update --all && \
    tlmgr install latexmk texliveonfly letltxmacro textpos isodate titlesec substr enumitem   
