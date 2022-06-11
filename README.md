# Minimal LaTeX images

[![CI](https://github.com/dhnza/latex_slim_docker/actions/workflows/main.yml/badge.svg)](https://github.com/dhnza/latex_slim_docker/actions/workflows/main.yml)

This is a lightweight Docker image for compiling LaTeX documents. It is based
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

### Automatic LaTeX Package Installation

This images comes with `texliveonfly`, a Python script that will automatically
download LaTeX packages required to compile a document. It is a wrapper around
the LaTeX compilers.

To compile a document, simply run
```
 $ texliveonfly filename.tex
```

It even supports `latexmk`.
```
 $ texliveonfly --compiler=latexmk --arguments='-shell-escape -interaction=nonstopmode -pdf' filename.tex
```

You can use `texliveonfly` to retrieve the list of `tlmgr` packages needed by a document.
```
 $ texliveonfly filename.tex 2>&1 | awk '/^texliveonfly.*install LaTex package/ {print $NF}'
```

## Tags

The images come in two variants:
- `latest`
- `minimal`

The `latest` tag includes the LaTeX collections listed above. The `minimal`
tag includes all the same collections, except for `collection-mathscience`.

## DockerHub

The image is available on [DockerHub](https://hub.docker.com/r/dhna/latex_slim).
