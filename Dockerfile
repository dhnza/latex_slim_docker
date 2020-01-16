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
    # Clean up
    cd / && rm -rf install-tl* && \
    apt-get autoremove -y && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/local/texlive/2019/bin/x86_64-linux:${PATH}"

# Install tlmgr packages
RUN tlmgr update --all && \
    tlmgr install latexmk texliveonfly
