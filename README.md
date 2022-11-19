# Prepub (WIP)

## Description

This is a companion package for Dart/Flutter package maintainers to help with automating some processes and ensuring a certain format standard.
Originally made for Remi Rousellet's needs, but can be adopted by any package maintainer.

Currently in testing status. Do not depend on this package.

## Example usage

WIP workflow for Riverpod:

```yaml
name: Validate changelog format and sync

concurrency: 
  group: ${{ github.ref }}
  cancel-in-progress: true

env:
  IGNORED_PATH_MD: '**.md'
  IGNORED_PATH_MDX: '**.mdx'

on:
  workflow_dispatch:
  pull_request:
    paths-ignore:
      - IGNORED_PATH_MD
      - IGNORED_PATH_MDX
  push:
    branches:
      - master
    paths-ignore:
      - IGNORED_PATH_MD
      - IGNORED_PATH_MDX
  schedule:
    # runs the CI everyday at 10AM
    - cron: "0 10 * * *"

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3

      - name: Get changed files
        id: changed-files
        uses: tj-actions/changed-files@v32

      - uses: dart-lang/setup-dart@v1

      - name: Add pub cache bin to PATH
        run: echo "$HOME/.pub-cache/bin" >> $GITHUB_PATH

      - name: Add pub cache to PATH
        run: echo "PUB_CACHE="$HOME/.pub-cache"" >> $GITHUB_ENV

      - name: Activate prepub
        run: dart pub global activate prepub # specify 1.0.0?
      - name: Run prepub
        run: |
          dart run bin/main.dart -f "${{ steps.changed-files.outputs.all_changed_files }}"
```

### Codecov

codecov:
```
dart pub global run coverage:format_coverage --packages=.dart_tool/package_config.json --report-on=lib --lcov -o ./coverage/lcov.info -i ./coverage --check-ignore && lcov --remove coverage/lcov.info '*/*.g.dart' -o coverage/lcov.info && genhtml -o ./coverage/report ./coverage/lcov.info
```