# devto.sh

Leverage bash and github actions to automate posting to [dev.to](https://dev.to)

![](https://github.com/fennecdjay/devto.sh/workflows/dev.to/badge.svg)


## Setup

There is just a few steps to complete to get started.

### Prerequisite

This assumes you already have both
a [github account](https://github.com/join)
and a[dev.to account](https://dev.to/enter).

### As a [template](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-templatehttps://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template) repository
Use [this template](https://github.com/fennecdjay/devto.sh/generate)
Get a [dev.to](https://dev.to) [API key](https://docs.dev.to/api/)
Set it has DEVTO_API_KEY in your repository settings.
  > see [here](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets)

### As a github action

An example workflow to automate cross-posting:

``` yml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Create local changes
      run: |
        ...
    - name: update dev.to
      uses: fennecdjay/devto.sh/@master
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
```

## Bash script

The script takes 2 arguments:
  * the *source* of the blog
  * the dev.to *API_KEY*

it will update (or create if necessary) any markdown file
in the *source* directory.

## Github Action

When triggered (when you push),
the action will run the script to update your [dev.to](https://dev.to) account

## Default settings

the *source* directory is `src`  
the *markdown extension* is `.md`  
the API_KEY is named `DEVTO_API_KEY`  
