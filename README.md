# devto.sh

Leverage bash and github actions to automate posting to [dev.to](https://dev.to)

## Bash script

The script takes 2 arguments:
  * the *source* of the blog
  * the dev.to *API_KEY*

it will update (or create if necessary) any markdown file
in the *source* directory.

## Github Action

  > The DEVTO_API_KEY has to be set in your repository settings.
  see [here](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets)


When triggered (when you push),
the action will run the script to update your [dev.to](https://dev.to) account

## Default settings

the *source* directory is `src`
the *markdown extension* is `.md`
the API_KEY is named 'DEVTO_API_KEY'

