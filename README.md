# homebrew-ffmpeg

[![Build Status](https://travis-ci.com/homebrew-ffmpeg/homebrew-ffmpeg.svg?branch=master)](https://travis-ci.com/homebrew-ffmpeg/homebrew-ffmpeg)

This is a 3<sup>rd</sup> party tap for [Homebrew](https://brew.sh/). It provides a formula for `ffmpeg` which includes options for enabling additional features and libraries.

Contents:

- [Installation and usage](#installation-and-usage)
- [Updating](#updating)
- [Included libraries](#included-libraries)
- [Troubleshooting](#troubleshooting)
- [Issues](#issues)
- [Maintainers](#maintainers)

## Installation and usage

In order to use this tap, you need to install Homebrew.

Then, to run a default installation, run:

```
brew tap homebrew-ffmpeg/ffmpeg
brew install homebrew-ffmpeg/ffmpeg/ffmpeg
```

**Note:** If you already have `ffmpeg` installed from Homebrew core, you will receive an error. You need to first run `brew uninstall ffmpeg` before you can use this tap.

### Installing with options

To see the list of supported options for this formula, run:

```
brew options homebrew-ffmpeg/ffmpeg/ffmpeg
```

Then, you can run:

```
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-<option1> --with-<option2> ...
```

If you **really** wish to install all the available options, you can run:

```
brew install homebrew-ffmpeg/ffmpeg/ffmpeg $(brew options homebrew-ffmpeg/ffmpeg/ffmpeg --compact)
```

Note that this may install libraries for which you need extra SDKs installed, such as `--with-decklink`, or libraries which have to be installed before running the formula, such as `--with-chromaprint`.

### Installing latest Git version (`HEAD`)

FFmpeg recommends installing the latest Git master version over a release. This formula builds the latest release by default, but you can install the latest Git version by adding the `--HEAD` option:

```
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --HEAD
```

## Updating

To update Homebrew and upgrade the formula to the most recent stable release:

```
brew update && brew upgrade homebrew-ffmpeg/ffmpeg/ffmpeg
```

Or, if you are using the `HEAD` version and want to update to the latest commit:

```
brew update && brew upgrade homebrew-ffmpeg/ffmpeg/ffmpeg --fetch-HEAD
```

## Included libraries

This formula installs the following libraries by default:

| Dependency | Description |
| ---------- | ----------- |
| `libaom` | AV1 encoder |
| `fontconfig` | Font access library |
| `freetype` | Freetype font engine |
| `frei0r` | frei0r filters |
| `lame` | LAME MP3 encoder |
| `libass` | ASS subtitle support |
| `libvorbis` | Vorbis encoder |
| `libvpx` | VP8 and VP9 encoder |
| `opus` | Opus encoder |
| `rtmpdump` | RTMP dumping support |
| `sdl2` | Simple DirectMedia Layer |
| `snappy` | Snappy compression support |
| `theora` | Theora encoder |
| `x264` | x264 H.264 encoder |
| `x265` | x265 HEVC encoder |
| `xz` | XZ compression support |

This formula features the following libraries optionally:

| Dependency | Description | Remarks |
| ---------- | ----------- | ------- |
| `chromaprint` | Chromaprint audio fingerprinting library | See the workaround in the [Troubleshooting](#troubleshooting) section.
| `decklink` | Enable DeckLink support | The DeckLink SDK has to be installed **before** running the FFmpeg formula. One possibility is to use:<br>```brew install amiaopensource/amiaos/decklinksdk```
| `fdk-aac` | Fraunhofer FDK AAC library |
| `game-music-emu` | game-music-emu support |
| `libbluray` | libbluray support |
| `libbs2b` | libbs2b support |
| `libcaca` | libcaca support |
| `libgsm` | libgsm support |
| `libmodplug` | libmodplug support |
| `librsvg` | SVG files as inputs via librsvg |
| `libsoxr` | soxr resample library |
| `libssh` | SFTP protocol via libssh |
| `libvidstab` | vid.stab support for video stabilization |
| `libvmaf` | VMAF video quality metric |
| `libxml2` | libxml2 library |
| `opencore-amr` | Opencore AMR NR/WB audio format |
| `openh264` | OpenH264 library |
| `openjpeg` | JPEG 2000 image format |
| `openssl` | SSL support |
| `rav1e` | AV1 encoding via librav1e |
| `rtmpdump` | rtmpdump support |
| `rubberband` | rubberband library |
| `speex` | speex support |
| `srt` | SRT library |
| `tesseract` | tesseract OCR engine |
| `two-lame` | two-lame support |
| `wavpack` | wavpack support |
| `webp` | libwebp to encode WEBP images |
| `xvid` | xvid support |
| `zeromq` | libzeromq to receive commands sent through a libzeromq client |
| `zimg` | z.lib zimg library |

## Troubleshooting

When installing a piece of SOFTWARE which is using this FFmpeg distribution, then you may get the following error:
```
==> Installing dependencies for SOFTWARE: ffmpeg
Error: ffmpeg is already installed from homebrew-ffmpeg/ffmpeg!
Please `brew uninstall ffmpeg` first."
```

Here is a workaround:
```
brew uninstall ffmpeg
brew install SOFTWARE
brew uninstall --ignore-dependencies ffmpeg
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-YOUR-OPTIONS
```

## Issues

To report issues, please [file an issue on GitHub](https://github.com/homebrew-ffmpeg/homebrew-ffmpeg/issues). Please note that we will only be able to help with issues that are exclusive to this tap and for OS which are officially supported.

If the problem is reproducible with the `homebrew-core` version of `ffmpeg`, please file it [on their tracker](https://github.com/Homebrew/homebrew-core/).

## Maintainers

- Reto Kromer (`@retokromer`)
- Werner Robitza (`@slhck`)
