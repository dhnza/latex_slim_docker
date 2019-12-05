# latex_slim_docker

This is a lightwieght Docker image for compiling Latex documents. It is based
on the [latest Ubuntu image](https://hub.docker.com/_/ubuntu). It includes the
latest version of TexLive provided by [this PPA](https://launchpad.net/~jonathonf/+archive/ubuntu/texlive).

The image includes the following packages:
- texlive-base
- texlive-xetex
- latexmk

Additional packages can be installed with `tlmgr`
```
 $ tlmgr update --all
 $ tlmgr install <package-name>
```

## DockerHub

The image is available in [DockerHub](https://hub.docker.com/r/dhna/latex_slim).
