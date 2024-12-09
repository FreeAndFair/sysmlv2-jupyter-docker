# Docker image for running SysML v2

Create a docker image for running [SysML v2 Release](https://github.com/Systems-Modeling/SysML-v2-Release) in Jupyter.

The setup is taken from the [Jupyter installation](https://github.com/Systems-Modeling/SysML-v2-Release/tree/master/install/jupyter).

In addition, an [API Server](https://github.com/Systems-Modeling/SysML-v2-API-Services) is also started and everything published in Jupyter will be pushed into this server.

## Update - Dec 2024

Because Free & Fair is using SysMLv2 as part of active R&D and needs an up-to-date Docker container, we will be updating this image for new releases of the SysMLv2 Pilot Implementation as we find it necessary; we are not, however, committed to updating it for every SysMLv2 release in a prompt fashion.  Images will be pushed to [Free & Fair's DockerHub](https://hub.docker.com/?namespace=freeandfair).

## Update - Oct 2024 (from gorenje)

I [no longer actively](https://github.com/gorenje/sysmlv2-jupyter-docker/issues/19#issuecomment-2193902929) maintain this repository, all my apologises to those frustrated by that. I have no active interest in SysMLv2 and hence doing this for free was counterproductive for me.

Instead I now actively work with [Node-RED](https://nodered.org) which provides a UML-like visual programming interface for (I)IoT development. For those using SysMLv2, Node-RED provides a similar visual interface but with the advantage of code being visual so that the visuals become the code. I have worked on a [Flow2UML](https://flows.nodered.org/node/@gregoriusrippenstein/node-red-contrib-flow2uml) plugin for Node-RED to convert flow based code to UML diagrams. This highlights the similarities between the two.

## Remote Services

You can try this out on Binder, via DockerHub or just view the notebooks at nbviewer.

### Binder

You can run this on [Binder](https://mybinder.org) but it will only run the SysMLv2-based Jupyter server, not the API server.

Latest version: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/freeandfair/sysmlv2-jupyter-docker/HEAD)

See below for specific release links.

You can also view notebooks via [nbviewer](https://nbviewer.jupyter.org/github/freeandfair/sysmlv2-jupyter-docker/tree/master/notebooks) and from there it's possible to start up [Binder](https://mybinder.org).

### DockerHub

Images are also available [on DockerHub](https://hub.docker.com/r/freeandfair/sysmlv2-jupyter). These are only of the Jupyter installation, not the API server.

See below for specific pull statements.

### nbviewer

Repo can also be viewed using [nbviewer](https://nbviewer.jupyter.org/github/freeandfair/sysmlv2-jupyter-docker/tree/main/).

See below for specific release links.

### Dedicated Server

Thanks to [Tim Weilkiens](https://github.com/Weilkiti), there is now a dedicated [server](https://www.sysmlv2lab.com/) running the [latest](https://hub.docker.com/r/freeandfair/sysmlv2-jupyter/tags?ordering=last_updated&page=1&name=latest) version of this repo.

### Overview

| [nbviewer](https://nbviewer.jupyter.org/github/freeandfair/sysmlv2-jupyter-docker/tree/main/) | [binder](https://mybinder.org/v2/gh/freeandfair/sysmlv2-jupyter-docker/HEAD) | [docker hub](https://hub.docker.com/r/freeandfair/sysmlv2-jupyter) |
|:--|:--|:--|
| [2023-02](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2023-02/) | [2023-02](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2023-02) |  `docker pull gorenje/sysmlv2-jupyter:2023-02` |
| [2022-07](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2022-07/) | [2022-07](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2022-07) |  `docker pull gorenje/sysmlv2-jupyter:2022-07` |
| [2022-06](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2022-06/) | [2022-06](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2022-06) |  `docker pull gorenje/sysmlv2-jupyter:2022-06` |
| [2022-05](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2022-05/) | [2022-05](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2022-05) |  `docker pull gorenje/sysmlv2-jupyter:2022-05` |
| [2022-04](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2022-04/) | [2022-04](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2022-04) |  `docker pull gorenje/sysmlv2-jupyter:2022-04` |
| [2022-03](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2022-03/) | [2022-03](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2022-03) |  `docker pull gorenje/sysmlv2-jupyter:2022-03` |
| [2022-02](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2022-02/) | [2022-02](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2022-02) |  `docker pull gorenje/sysmlv2-jupyter:2022-02` |
| [2022-01](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2022-01/) | [2022-01](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2022-01) |  `docker pull gorenje/sysmlv2-jupyter:2022-01` |
| [2021-12](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2021-12/) | [2021-12](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2021-12) |  `docker pull gorenje/sysmlv2-jupyter:2021-12` |
| [2021-11](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2021-11/) | [2021-11](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2021-11) |  `docker pull gorenje/sysmlv2-jupyter:2021-11` |
| [2021-10](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2021-10/) | [2021-10](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2021-10) |  `docker pull gorenje/sysmlv2-jupyter:2021-10` |
| [2021-09](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2021-09/) | [2021-09](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2021-09) |  `docker pull gorenje/sysmlv2-jupyter:2021-09` |
| [2021-08.1](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2021-08.1/) | [2021-08.1](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2021-08.1) |  `docker pull gorenje/sysmlv2-jupyter:2021-08.1` |
| [2021-08](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2021-08/) | [2021-08](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2021-08) |  `docker pull gorenje/sysmlv2-jupyter:2021-08` |
| [2021-06](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2021-06/) | [2021-06](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2021-06) |  `docker pull gorenje/sysmlv2-jupyter:2021-06` |
| [2021-05](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2021-05/) | [2021-05](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2021-05) |  `docker pull gorenje/sysmlv2-jupyter:2021-05` |
| [2021-04](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2021-04/) | [2021-04](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2021-04) |  `docker pull gorenje/sysmlv2-jupyter:2021-04` |
| [2021-03](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2021-03/) | [2021-03](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2021-03) |  `docker pull gorenje/sysmlv2-jupyter:2021-03` |
| [2021-02](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2021-02/) | [2021-02](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2021-02) |  `docker pull gorenje/sysmlv2-jupyter:2021-02` |
| [2021-01](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2021-01/) | [2021-01](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2021-01) | `docker pull gorenje/sysmlv2-jupyter:2021-01`  |
| [2020-12](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2020-12/) | [2020-12](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2020-12) |  `docker pull gorenje/sysmlv2-jupyter:2020-12` |
| [2020-11](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2020-11/)  | [2020-11](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2020-11) |  `docker pull gorenje/sysmlv2-jupyter:2020-11` |
| [2020-10](https://nbviewer.jupyter.org/github/gorenje/sysmlv2-jupyter-docker/tree/release-2020-10/) |  [2020-10](https://mybinder.org/v2/gh/gorenje/sysmlv2-jupyter-docker/release-2020-10) | `docker pull gorenje/sysmlv2-jupyter:2020-10` |

## Local Usage

Be aware, building the docker images will take a while since all the software
packages will be retrieved. Everything is built and run locally.

### Prerequistes

- [Docker](https://www.docker.com/)

Everything else is installed by the build process.

### Makefile

To start up the SysML-Jupyter server, the postgres server and the API server:

    make spin-up

Then point your browser first to ```http://localhost:9000/docs/``` -
this will setup the database for the API server. Once this displays a
page, then point your browswer to the Jupyter page. This is on
```http://localhost:8888```, don't use the hostname
```sysmljupyter```, that's internal to docker.

```
    To access the notebook, open this file in a browser:
        file:///root/.local/share/jupyter/runtime/nbserver-1-open.html
    Or copy and paste one of these URLs:
        http://sysmljupyter:8888/?token=392e5b7c0e8cde28d6f988862bc7ad81ba6c517e31b63520
     or http://127.0.0.1:8888/?token=392e5b7c0e8cde28d6f988862bc7ad81ba6c517e31b63520
```

The token is unique for each start of the container.

NOTE: If `localhost` does not work in the URLs, try `127.0.0.1` instead.

### Using Docker

If you want to do this using Docker only, i.e. no makefile, then have a
look at the Makefile.  Basically it's something along the lines of:
```
    docker build -t sysml.jupyter -f Dockerfile.jupyter .
    docker build -t sysml.api     -f Dockerfile.api     .
    docker network create thenetwork
    docker volume create postgresdbserver
    docker compose -f docker-compose.yml up
```
That is the same as doing ```make spin-up```.

### Other Docker Builds

The Makefile also does the following builds for local usage:

1. `make build-mybinder` will build the docker image that is used with mybinder. This image can then be run locally using `make run-mybinder`.

2. `make build-hub` will build the docker hub image. Running this image can be done with `make run-hub`.

3. `make build-api DB_SERVER_URL=<server url> DB_USER=<username in your db> DB_PASSWORD=<your password>` builds the api server for the defined database server.

4. `make build-jupyter SYSML_API_SERVER=<your API server>` builds the jupyter container image for your api server instance.

5. `make build-latest` builds the api server and jupyter server as defined above and labels it as latest. The aformentioned build arguments can be used, too.

These also work for each release that is supported by this repo.

### Checking out other Releases

Each release has it's own branch, so for example to test the [SysML v2 Release 2020-12](https://github.com/Systems-Modeling/SysML-v2-Release/releases/tag/2020-12), do the following:

```
git checkout release-2020-12
make run-hub
```

That will locally start DockerHub Jupyter image with the 2020-12 release. Note that branches for some releases, from early 2023 to late 2024, are currently missing because the repository was not being actively updated during that time.

## Production Use?

Don't.

This isn't designed for production use, this is for local or trusted
use only.

## Example Notebooks

There are a few example notebooks included in the image, their
usefulness might vary according to your experience level.

## Creating Your Own Notebooks

There is a "mydata" folder that you can create your own notebooks
in.  It is tied to your local file system, and thus will persist over
time.

## Inspiration

- [MBSE4U.com](https://mbse4u.com/2020/12/21/sysml-v2-release-whats-inside/) is where I found the meta commands.
- Also from MBSE4U.com, the example [notebook](https://nbviewer.jupyter.org/github/MBSE4U/SysMLv2JupyterBook/blob/master/SysMLv2JupyterBook.ipynb) at [nbviewer.jupyter.org](https://nbviewer.jupyter.org).

## Building a New Release

Free & Fair DockerHub releases are pushed automatically by GitHub continuous deployment when the `main` branch is updated. The procedure for making a new release for a new SysMLv2 release is as follows.

When a new
[release tag](https://github.com/Systems-Modeling/SysML-v2-Release/tags) 
becomes available, the following things need doing:

1. Ensure there is a corresponding [API Server](https://github.com/Systems-Modeling/SysML-v2-API-Services/tags) release.
2. Start a new branch from the main branch, and follow this [commit](https://github.com/FreeAndFair/sysmlv2-jupyter-docker/commit/1869262840e7fa3eb9ced8dc21a6119f5483543d) to update all dockerfiles & Makefile for the new release (in this case 2024-09 SysMLv2 with 2024-07 API server). 
3. Run `make build` to check that all dockerfiles build locally. Make sure that Docker is running locally.
4. In a terminal window, run `make spin-up` to start a Jupyter server locally.
5. In another terminal window, run `make update-testsuite` to update all the test notebooks in the repository. This also retrieves the notebooks from the Docker images and, in the end, there is a commit similar to this [one](https://github.com/freeandfair/sysmlv2-jupyter-docker/commit/3597bc3cc1fa2375163b562b02765b4640e3af22).
6. Create a GitHub PR for the new branch and make sure that the GitHub Actions check succeeds.
7. Merge the PR to `main`.
8. Done. The new DockerHub image should be deployed to DockerHub automatically.

## Licensing

Both [SysMLv2 API Server](https://github.com/Systems-Modeling/SysML-v2-API-Services/blob/master/LICENSE) and [SysMLv2 Release](https://github.com/Systems-Modeling/SysML-v2-Release/blob/master/LICENSE) are licensed under the LGPL and this continues to be the case.

**This project does not make any changes to the existing licensing of the
referenced projects.**

This project is also licensed under the [LGPL](/LICENSE).
