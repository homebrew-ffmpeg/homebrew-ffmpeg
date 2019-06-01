# homebrew-ffmpeg

This is a 3rd party tap for [Homebrew](http://brew.sh/). It provides a formula for `ffmpeg` which includes options for enabling additional features and libraries.

Contents:

- [Installation and usage](#installation-and-usage)
- [Updating](#updating)
- [FAQ](#faq)
- [Included libraries](#included-libraries)
- [Issues](#issues)
- [Maintainers](#maintainers)

## Installation and usage

In order to use this tap, you need to install Homebrew or Linuxbrew.

Then, to run a default installation, run:

```
brew tap varenc/ffmpeg
brew install varenc/ffmpeg/ffmpeg
```

**Note:** If you already have `ffmpeg` installed from Homebrew core, you will receive an error. You need to first run `brew uninstall ffmpeg` before you can use this tap.

### Installing with options

To see the list of supported options for this formula, run:

```
brew options varenc/ffmpeg/ffmpeg
```

Then, you can run:

```
brew install varenc/ffmpeg/ffmpeg --with-<option1> --with-<option2> ...
```

### Installing latest Git version (`HEAD`)

FFmpeg recommends installing the latest Git master version over a release. This formula builds the latest release by default, but you can install the latest Git version by adding the `--HEAD` option:

```
brew install varenc/ffmpeg/ffmpeg --HEAD
```

### Installing *everything*

To compile and install ffmpeg with *all* options, just run:

```
brew install varenc/ffmpeg/ffmpeg $(brew options varenc/ffmpeg/ffmpeg --compact)
```

Note that this will perform a full build of ffmpeg and its dependencies, which may take a while depending on your machine's capabilities.

## Updating

To update Homebrew and upgrade the formula to the most recent stable release:

```
brew update && brew upgrade varenc/ffmpeg/ffmpeg
```

Or, if you are using the `HEAD` version and want to update to the latest commit:

```
brew update && brew upgrade varenc/ffmpeg/ffmpeg --fetch-HEAD
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
| `chromaprint` | Chromaprint audio fingerprinting library |
| `decklink` | Enable DeckLink support | The DeckLink SDK has to be installed before running the FFmpeg formula.
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

## Issues

To report issues, please [file an issue on GitHub](https://github.com/varenc/homebrew-ffmpeg/issues). Please note that we will only be able to help with issues that are exclusive to this tap.

If the problem is reproducible with the `homebrew-core` version of `ffmpeg`, please file it [on their tracker](https://github.com/Homebrew/homebrew-core/).

## Maintainers

- Chris Varenhorst (`@varenc`)
- Reto Kromer (`@retokromer`)
- Werner Robitza (`@slhck`)
