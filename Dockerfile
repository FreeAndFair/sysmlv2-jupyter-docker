FROM openjdk:17-slim

##
## This Dockerfile is specifically designed for execution at
## https://mybinder.org.
##

## `wget` is used to retrieve Conda and SysML Release. Inkscape and
## LaTeX is required for rendering notebooks as PDFs.
RUN apt-get --quiet --yes update && apt-get install -yqq \
  wget                        \
  inkscape                    \
  texlive-fonts-recommended   \
  texlive-base                \
  texlive-xetex

##
## Non-root user is a requirement of Binder:
##   https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html
##
ARG NB_USER=sysml
ARG NB_UID=1000
ENV USER=${NB_USER}
ENV NB_UID=${NB_UID}
ENV HOME=/home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

USER root
RUN chown -R ${NB_UID} ${HOME}

## Switch to the lowly `sysml` user, no more root.
USER ${NB_USER}
WORKDIR ${HOME}

##
## Miniconda is used for Python package management.  It is the better
## choice than Anaconda due to the licensing imposed by the latter.
##
## Miniconda installation page:
## https://docs.conda.io/en/latest/miniconda.html#linux-installers
##
RUN wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-$(uname -m).sh

## Defining the RELEASE down here ensures that the previous commands
## can be recycled since they are not affected by the release version.
ARG RELEASE=2024-11

##
## SysML page: https://github.com/Systems-Modeling/SysML-v2-Release
##
RUN wget -q https://github.com/Systems-Modeling/SysML-v2-Release/archive/refs/tags/${RELEASE}.tar.gz -O ${RELEASE}.tar.gz
# https://github.com/Systems-Modeling/SysML-v2-Release/archive/refs/tags/2024-09.tar.gz
## Install MiniConda.
RUN chmod 755 ${HOME}/Miniconda3-latest-Linux-$(uname -m).sh
RUN mkdir ${HOME}/conda
RUN ${HOME}/Miniconda3-latest-Linux-$(uname -m).sh -f -b -p ${HOME}/conda
RUN ${HOME}/conda/condabin/conda init

## Use a different solver to avoid conda hanging.
RUN ${HOME}/conda/condabin/conda update conda
RUN ${HOME}/conda/condabin/conda install -n base conda-build conda-libmamba-solver
RUN ${HOME}/conda/condabin/conda config --set solver libmamba

## Install SysML.
RUN tar xzf ${RELEASE}.tar.gz
RUN rm ${RELEASE}.tar.gz

WORKDIR ${HOME}/SysML-v2-Release-${RELEASE}/install/jupyter

## This is the path that `conda init` creates but `conda init` has no
## effect here, so set the `PATH` by hand, otherwise `install.sh` will
## not work.
ENV PATH="${HOME}/conda/bin:${HOME}/conda/condabin:/usr/local/openjdk-17/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
RUN ./install.sh

WORKDIR ${HOME}/SysML-v2-Release-${RELEASE}/

## Move any files in the top level directory to the doc directory.
RUN find . -maxdepth 1 -type f -exec mv \{\} doc \;

## Copy all notebooks into the docker image. Move them into a notebooks
## subdirectory so that nbviewer + mybinder can work together.
RUN mkdir notebooks
COPY --chown=${NB_USER} notebooks/ notebooks/

## This only makes sense in the `make spin-up` environment, i.e. locally.
RUN rm notebooks/*/StartHere.ipynb

## Trust the notebooks so that the SVG images will be displayed.
RUN find . -name \*.ipynb -exec jupyter trust \{\} \;
