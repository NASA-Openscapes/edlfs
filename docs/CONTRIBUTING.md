# Contributing

Thank you for your interest in helping make NASA's Earth observing data more accessible!

We're excited you would like to contribute to `edlfs`! Whether you're finding bugs, adding new features, fixing anything broken, or improving documentation, get started by submitting an issue or pull request!

## Submitting an Issue

If you have any questions or ideas, or notice any problems or bugs, first [search open issues](https://github.com/NASA-Openscapes/edlfs/issues) to see if the issue has already been submitted. We may already be working on the issue. If you think your issue is new, you're welcome to [create a new issue](https://github.com/NASA-Openscapes/edlfs/issues/new).

## Pull Requests are welcome

Found a typo, know how to fix a bug, want to update the docs, want to add a new feature? Great!

The smaller the PR, the easier it is to review and test and the more likely it is to be successful.

For major contributions, consider opening [an issue](https://github.com/NASA-Openscapes/edlfs/issues/new) describing the contribution so that we can help guide and breakup the work into digestible pieces.

### Workflow
If you want to submit your own contributions, please use a [forking workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow).

The basic steps are:
1. Fork the repository:

   ![fork button](imgs/fork-button.png?raw=true)

2. Clone your fork
   ```shell
   git clone https://github.com/[OWNER]/edlfs.git
   cd edlfs
   ```
3. Add this repository as an `upstream` remote
   ```shell
   git remote add upstream https://github.com/NASA-Openscapes/edlfs.git
   ```  
4. Create a feature branch based on the upstream/develop branch
   ```shell
   git fetch --all --prune
   git checkout -c [NAME] upstream/develop
   ```
5. Set up your development environment  using [`conda`](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html)/[`mamba`](https://github.com/mamba-org/mamba)
   ```shell
   mamba env update -f environment.yml
   mamba activate edlfs
   python -m pip install -e .
   ```
6. Make your changes! Then push them to your fork
   ```shell
   git push -u origin [NAME]
   ```
7. Propose your changes by opening a pull request to `NASA-Openscapes/edlfs`'s `develop` branch

   ![pr base selection](imgs/fork-pr-bases.png?raw=true)

## Guidelines

We ask that you follow these guidelines with your contributions

### Style

We generally follow python community standards ([PEP8](https://pep8.org/)), except we allow line lengths up to 120 characters. We recommend trying to keep lines 80--100 characters long, but allow up to 120 when it improves readability.

### Documentation

We are working to improve our documentation!

For all public-facing functions/methods (not [marked internal use](https://www.python.org/dev/peps/pep-0008/#naming-conventions)), please include [type hints](https://google.github.io/styleguide/pyguide.html#221-type-annotated-code) (when reasonable) and a [docstring](https://www.python.org/dev/peps/pep-0257/) formatted [Google style](https://google.github.io/styleguide/pyguide.html#38-comments-and-docstrings).


### Tests

All the automated tests for this project need to pass before your submission will be accepted.

If you add new functionality, please consider adding tests for that functionality as well.

### Commits

* Make small commits that show the individual changes you are making
* Write descriptive commit messages that explain your changes

Example of a good commit message;

```
Improve contributing guidelines. Fixes #10

Improve contributing docs and consolidate them in the standard location
https://help.github.com/articles/setting-guidelines-for-repository-contributors/
```

### Changelog

Changes should be documented in the `CHANGELOG.md` and follow [this standard](http://keepachangelog.com/en/2.0.0/).
