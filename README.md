# homebrew-ffmpeg

This is a 3rd party tap for [Homebrew](http://brew.sh/). It provides a formula for `ffmpeg` which includes options for enabling additional features and libraries.

Contents:

- [Installation and usage](#installation-and-usage)
- [FAQ](#faq)
- [Issues](#issues)
- [Maintainers](#maintainers)

## Installation and usage

In order to use this tap, you need to install Homebrew or Linuxbrew.

To use, first tap and pin this repo:

```
brew tap varenc/ffmpeg
brew tap-pin varenc/ffmpeg
```

### Default installation

To install the default version of the formula, run:

```
brew install ffmpeg
```

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

## FAQ

### What is `tap-pin`?

Using `brew tap-pin` gives this tap's `ffmpeg` formula priority over homebrew-core to make installation simpler. Now `ffmpeg` will refer to this tap's formula.

If you don't want to pin this tap, you can still reference this tap's ffmpeg formula directly with `varenc/ffmpeg/ffmpeg`. Tap pinning will not influence an `ffmpeg` dependency in another formula.

To unpin the tap, simply run `brew tap-unpin varenc/ffmpeg`.

### I used the old repository name, what should I do?

This repo was previously named `ffmpeg-with-options`. While there is a redirect to the new repository name, you should update to the tap's new name. To do so, run:

```
brew untap varenc/ffmpeg-with-options
brew tap varenc/ffmpeg
brew tap-pin varenc/ffmpeg
```

## Issues

To report issues, please [file an issue on GitHub](https://github.com/varenc/homebrew-ffmpeg/issues). Please note that we will only be able to help with issues that are exclusive to this tap.

If the problem is reproducible with the `homebrew-core` version of `ffmpeg`, please file it [on their tracker](https://github.com/Homebrew/homebrew-core/).

## Maintainers

- Chris Varenhorst (`@varenc`)
- Reto Kromer (`@retokromer`)
- Werner Robitza (`@slhck`)
