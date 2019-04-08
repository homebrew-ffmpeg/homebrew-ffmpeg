# homebrew-ffmpeg

This is a 3rd party tap for [Homebrew](http://brew.sh/). It provides a formula for `ffmpeg` which includes options for enabling additional features and libraries.

Contents:

- [Installation and usage](#installation-and-usage)
- [Updating](#updating)
- [FAQ](#faq)
- [Issues](#issues)
- [Maintainers](#maintainers)

## Installation and usage

In order to use this tap, you need to install Homebrew or Linuxbrew.

Then, to run a default installation, run:

```
brew install varenc/ffmpeg/ffmpeg
```

**Note:** If you already have `ffmpeg` installed from Homebrew core, you will receive an error. You need to first run `brew uninstall ffmpeg` before you can use this tap.

### Installing with options

To see the list of supported options for this formula, run:

```
brew options ffmpeg
```

Then, you can run:

```
brew install ffmpeg --with-<option1> --with-<option2> ...
```

### Installing latest Git version (`HEAD`)

FFmpeg recommends installing the latest Git master version over a release. This formula builds the latest release by default, but you can install the latest Git version by adding the `--HEAD` option:

```
brew install ffmpeg --HEAD
```

### Installing *everything*

To compile and install ffmpeg with *all* options, just run:

```
brew install ffmpeg $(brew options ffmpeg --compact)
```

Note that this will perform a full build of ffmpeg and its dependencies, which may take a while depending on your machine's capabilities.

## Updating

To update Homebrew and upgrade the formula to the most recent stable release:

```
brew update && brew upgrade ffmpeg
```

Or, if you are using the `HEAD` version and want to update to the latest commit:

```
brew update && brew upgrade ffmpeg --fetch-HEAD
```

## Issues

To report issues, please [file an issue on GitHub](https://github.com/varenc/homebrew-ffmpeg/issues). Please note that we will only be able to help with issues that are exclusive to this tap.

If the problem is reproducible with the `homebrew-core` version of `ffmpeg`, please file it [on their tracker](https://github.com/Homebrew/homebrew-core/).

## Maintainers

- Chris Varenhorst (`@varenc`)
- Reto Kromer (`@retokromer`)
- Werner Robitza (`@slhck`)
