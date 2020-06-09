# latex_slim_docker

This is a lightwieght Docker image for compiling Latex documents. It is based
on the [latest Alpine image](https://hub.docker.com/_/alpine). It includes an
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


## DockerHub

The image is available on [DockerHub](https://hub.docker.com/r/dhna/latex_slim).
