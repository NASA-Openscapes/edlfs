# `edlfs`: a fsspec back-end that supports NASA's EDL

Accessing and using NASA's Earth observing data with [`fsspec`](https://filesystem-spec.readthedocs.io/en/latest/), or the software built on top of it like the [Pangeo stack](https://pangeo.io/), is *harder than it should be*. This package aims to abstract those complications away, and provide a convenient Python filesystem interface to NASA's Earth observing data.

## Challenges

The challenges this pacakge aims to overcome are detailed in [our overview](docs/overview.md) document, and briefly restated here:

* Most NASA Earth observing dataset require authenticated HTTP access via NASA's [Earthdata Login (EDL)]((https://urs.earthdata.nasa.gov/)). However, [`fsspec`](https://filesystem-spec.readthedocs.io/en/latest/) does not support EDL/OAuth2 out of the box.
* NASA supports different access patterns for cloud-based and on-prem datasets hosted at the various [Distributed Active Archive Centers (DAACs)](https://www.earthdata.nasa.gov/eosdis/daacs), where each DAAC may support only certain access patterns and auth mechanisms.
* Handling the above two challenges for large-scale, distributed workflows with tools like Dask adds additional complications. 

`edlfs` is being developed to hide those complications for users so interacting with NASA's Earth observing data, even at global-scale, is straightforward, much like how [`s3fs`](https://github.com/fsspec/s3fs) hides the complications of working with cloud-data from users. 

## Usage

### Quick start

```python
import edlfs

print(edlfs.__version__)
```

### Installation

In order to easily manage dependencies, we recommend using dedicated project environments
via [Anaconda/Miniconda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html)
or [Python virtual environments](https://docs.python.org/3/tutorial/venv.html).

**NOTE:** `edlfs` will be available on PyPI and conda-forge with the `v0.1.0` release, which is coming soon! Until then, use the [Development](#development) install.

`edlfs` can be installed into a conda environment with

```shell
conda install -c conda-forge edlfs
```

or into a virtual environment with

```shell
python -m pip install edlfs
```

### Using the Docker image
`edlfs` provides a [docker container image](https://docs.docker.com/get-started/) with all the necessary dependencies pre-installed. To get the latest released version: 
```shell
docker pull ghcr.io/nasa-openscapes/edlfs:latest
```
a specific release version (>=v0.1.0 only):
```shell
docker pull ghcr.io/nasa-openscapes/edlfs:0.1.0
```
or the current development version:
```shell
docker pull ghcr.io/nasa-openscapes/edlfs:test
```

To run the container and jump into a bash shell inside:
```shell
docker run -it --rm ghcr.io/nasa-openscapes/edlfs:latest
```
To mount your current directory inside the container so that files will be written back to your local machine:
```shell
docker run -it -v ${PWD}:/home/conda/work --rm ghcr.io/nasa-openscapes/edlfs:latest
cd work
```
For more docker run options, see: <https://docs.docker.com/engine/reference/run/>.


## Contact us!

Found a bug? Want to request a feature?
[Open an issue](https://github.com/ASFHyP3/NASA-Openscapes/edlfs/new)

General questions? Suggestions? Or anything else?
[Start a discussion](https://github.com/NASA-Openscapes/edlfs/discussions/new)

Don't hesitate to reach out; we would love to hear from you!

## Development

To contribute to `edlfs`, first check out our [Code of Conduct](CODE_OF_CONDUCT.md) and our [contributing guide](docs/CONTRIBUTING.md).

### Development install

To create a development environment for `edlfs`, we recommend using [`conda`](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html)/[`mamba`](https://github.com/mamba-org/mamba) to create a development environment. First fork the repo and then:
```shell
git clone https://github.com/[OWNER]/edlfs.git
cd edlfs

mamba env update -f environment.yml  # will create if env. doesn't already exist
mamba activate edlfs

python -m pip install -e .
```

*Note:* Each time you go to make new changes/create new feature branches, you may want to ensure the environment and install are up-to-date by running:
```shell
# from the repository root
mamba env update -f environment.yml
mamba deactivate && mamba activate edlfs
python -m pip install -e .
```

### Collaborators

Feel free to add your name here, or if you want to sign up to be a maintainer, in the [package authors](pyproject.toml).
