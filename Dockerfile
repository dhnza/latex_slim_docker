FROM alpine:latest
MAINTAINER dhna

COPY texlive.profile texlive.profile

# Install TexLive
RUN <<EOF
    # Dependencies and utilities
    apk add --no-cache \
        ca-certificates fontconfig make perl python3 wget xz
    # Download installer
    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
    tar -zxvf install-tl-unx.tar.gz
    rm install-tl-unx.tar.gz
    # Install TexLive
    cd install-tl*/
    ./install-tl --profile=/texlive.profile --force-platform x86_64-linuxmusl
    # Clean up
    cd / && rm -rf install-tl*
    rm -rf /var/cache/apk/*
EOF

ENV PATH="/usr/local/texlive/latest/bin/x86_64-linuxmusl:${PATH}"

# Install tlmgr packages
RUN <<EOF
    tlmgr update --all
    tlmgr install latexmk texliveonfly
EOF
