FROM ubuntu:latest
MAINTAINER dhna

# Install TexLive and other utilities
RUN apt-get update && \
    # texlive-latex-extra settings
    echo "12\n9\n" | \
    apt-get install --no-install-suggests --no-install-recommends -y \
        # TeX Live essentials
        texlive-base \
        texlive-xetex \
        texlive-latex-recommended \
        texlive-fonts-recommended \
        texlive-latex-extra \
        texlive-science \
        # Utilities
        make \
        latexmk \
        && \
    apt-get autoremove -y && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*
