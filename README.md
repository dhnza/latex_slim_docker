# latex_slim_docker
This is a lightwieght Docker image for compiling Latex documents. It is based
on the [latest Ubuntu image](https://hub.docker.com/_/ubuntu). To keep the
image small, few packages are included.

The image includes the following packages:
- texlive-base
- texlive-xetex
- texlive-latex-recommended
- texlive-fonts-recommended
- texlive-latex-extra
- texlive-science
- latexmk

## DockerHub

The image is available in [DockerHub](https://hub.docker.com/r/dhna/latex_slim).
