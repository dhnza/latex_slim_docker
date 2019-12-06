# latex_slim_docker

This is a lightwieght Docker image for compiling Latex documents. It is based
on the [latest Ubuntu image](https://hub.docker.com/_/ubuntu). It includes an
[official TexLive installation](https://www.tug.org/texlive/quickinstall.html).

The image includes the following collections and packages:
- collection-latexrecommended
- collection-mathscience
- collection-xetex
- latexmk
- texliveonfly

Additional packages can be installed with `tlmgr`
```
 $ tlmgr update --all
 $ tlmgr install <package-name>
```

### Automatic Latex Package Installation

This images comes with `texliveonfly`, a Python script that will automatically
download Latex packages required to compile a document. It is a wrapper around
the Latex compilers.

To compile a document, simply run
```
 $ texliveonfly filename.tex
```

It even supports `latexmk`.
```
 $ texliveonfly --compiler=latexmk --arguments='-shell-escape -pdf' filename.tex
```


## apt tag

The image tagged with `apt` includes an installation of TexLive that is managed
by Ubuntu's apt package manager. It uses [this
PPA](https://launchpad.net/~jonathonf/+archive/ubuntu/texlive) to get the
latest version of TexLive. Packages can be installed with `tlmgr`, but
`texliveonfly` is not included.


## DockerHub

The image is available on [DockerHub](https://hub.docker.com/r/dhna/latex_slim).
