# `edlfs`: a fsspec back-end that supports NASA's EDL

Accessing and using NASA's Earth observing data with is [`fsspec`](https://filesystem-spec.readthedocs.io/en/latest/), or the software built on top of it like the [Pangeo stack](https://pangeo.io/), is *harder than it should be*. This package aims to abstract those complications away, and provide a convenient Python filesystem interface to NASA's Earth observing data.

## Challenges

The challenges this pacakge aims to overcome are detailed in [our overview](docs/overview.md) document, and breifly restated here:

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



### Using the Docker image
`edlfs` provides a [docker container image](https://docs.docker.com/get-started/) with all the necessary dependencies pre-installed. To get the latest released version: 
```
docker pull ghcr.io/nasa-openscapes/edlfs:latest
```
a specific release version (>=v0.1.0 only):
```
docker pull ghcr.io/nasa-openscapes/edlfs:0.1.0
```
or the current development version:
```
docker pull ghcr.io/nasa-openscapes/edlfs:test
```

To run the container and jump into a bash shell inside:
```
docker run -it --rm ghcr.io/nasa-openscapes/edlfs:latest
```
To mount your current directory inside the container so that files will be written back to your local machine:
```
docker run -it -v ${PWD}:/home/conda/work --rm ghcr.io/nasa-openscapes/edlfs:latest
cd work
```
For more docker run options, see: <https://docs.docker.com/engine/reference/run/>.


### Development



### Collaborators

Feel free to add your name here, or if you want to sign up to be a maintainer, in the [package authors](pyproject.toml).
