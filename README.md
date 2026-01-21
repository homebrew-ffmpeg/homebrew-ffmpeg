# homebrew-ffmpeg

[![GH Actions CI](https://github.com/homebrew-ffmpeg/homebrew-ffmpeg/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/homebrew-ffmpeg/homebrew-ffmpeg/actions/workflows/main.yml)

This is a 3<sup>rd</sup> party tap for [Homebrew](https://brew.sh/). It provides a formula for `ffmpeg` which includes options for enabling additional features and libraries.

Contents:

- [Installation and usage](#installation-and-usage)
  - [Installing with options](#installing-with-options)
  - [Installing latest Git version (`HEAD`)](#installing-latest-git-version-head)
- [Updating](#updating)
- [Included libraries](#included-libraries)
- [Troubleshooting](#troubleshooting)
- [Issues](#issues)
- [Maintainers](#maintainers)

## Installation and usage

In order to use this tap, you need to install Homebrew.

Then, to run a default installation, run:

```bash
brew tap homebrew-ffmpeg/ffmpeg
brew install homebrew-ffmpeg/ffmpeg/ffmpeg
```

**Note:** If you already have `ffmpeg` installed from Homebrew core, you will receive an error. You need to first run `brew uninstall ffmpeg` before you can use this tap.

### Installing with options

To see the list of supported options for this formula, run:

```bash
brew options homebrew-ffmpeg/ffmpeg/ffmpeg
```

Then, you can run:

```bash
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-<option1> --with-<option2> ...
```

If you **really** wish to install all the available options, you can run:

```bash
brew install homebrew-ffmpeg/ffmpeg/ffmpeg $(brew options homebrew-ffmpeg/ffmpeg/ffmpeg --compact)
```

Note that this may install libraries for which you need extra SDKs installed, such as `--with-decklink`, or libraries which have to be installed before running the formula, such as `--with-chromaprint`.

### Installing latest Git version (`HEAD`)

FFmpeg recommends installing the latest Git master version over a release. This formula builds the latest release by default, but you can install the latest Git version by adding the `--HEAD` option:

```bash
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --HEAD
```

Please note that we don't generally provide support `HEAD` builds, since they may cause issues with other Homebrew-supplied formulae.

### Installing the commands under a different name

If you need to install the commands of this FFmpeg formula under an alternative name (for example, having the regular `ffmpeg`, `ffprobe` and `ffplay` commands in parallel with `ffmpeg-alt`, `ffprobe-alt` and `ffplay-alt`), you can run:

```bash
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-alt-name
```

## Updating

To update Homebrew and upgrade the formula to the most recent stable release:

```bash
brew update && brew upgrade homebrew-ffmpeg/ffmpeg/ffmpeg
```

Or, if you are using the `HEAD` version and want to update to the latest commit:

```bash
brew update && brew upgrade homebrew-ffmpeg/ffmpeg/ffmpeg --fetch-HEAD
```

## Included libraries

This formula installs the following libraries by default:

| Dependency   | Description                |
| ------------ | -------------------------- |
| `libaom`     | AV1 encoder                |
| `fontconfig` | Font access library        |
| `freetype`   | Freetype font engine       |
| `frei0r`     | frei0r filters             |
| `lame`       | LAME MP3 encoder           |
| `libass`     | ASS subtitle support       |
| `libvorbis`  | Vorbis encoder             |
| `libvpx`     | VP8 and VP9 encoder        |
| `opus`       | Opus encoder               |
| `rtmpdump`   | RTMP dumping support       |
| `sdl2`       | Simple DirectMedia Layer   |
| `snappy`     | Snappy compression support |
| `theora`     | Theora encoder             |
| `x264`       | x264 H.264 encoder         |
| `x265`       | x265 HEVC encoder          |
| `xz`         | XZ compression support     |

This formula features the following libraries optionally if you pass the respective `--with-<option>` flag(s):

| Option           | Description                                               | Remarks                                                                                                                                                                                                                                                                                                                                     |
| ---------------- | --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `--with-chromaprint`    | Chromaprint audio fingerprinting library                  | There is a cyclic dependency issue. See the workaround in the [Troubleshooting](#troubleshooting) section.                                                                                                                                                                                                                                  |
| `--with-decklink`       | DeckLink support                                          | The DeckLink SDK has to be installed **before** running the FFmpeg formula. One possibility is to use:<br>```brew install amiaopensource/amiaos/decklinksdk```<br><br>In addition, if you experience difficulties on macOS, make sure you follow [these directions](https://forum.blackmagicdesign.com/viewtopic.php?f=4&t=121992#p699837). |
| `--with-dvd`            | DVD-Video demuxer powered by `libdvdnav` and `libdvdread` |  |
| `--with-fdk-aac`        | Fraunhofer FDK AAC library                                |  |
| `--with-libflite`       | Text to speech synthesis                                  | Flite has to be installed **before** running the FFmpeg formula. This is not supported directly via Homebrew. See [this issue](https://github.com/homebrew-ffmpeg/homebrew-ffmpeg/issues/157) for some installation options.                                                                                                                |
| `--with-game-music-emu` | Game Music Emu (GME) support                              |  |
| `--with-jack`           | Jack audio device support                                 |  |
| `--with-jpeg-xl`        | JPEG XL support                                           |  |
| `--with-libaribb24`     | Decoding ARIB/ISDB captions                               |  |
| `--with-libaribcaption` | Handling of ARIB STD-B24 based broadcast captions         |  |
| `--with-libmodplug`     | Module/tracker files as inputs via libmodplug             |  |
| `--with-libopenmpt`     | Module/tracker files as inputs via libopenmpt             |  |
| `--with-libplacebo`     | GPU-accelerated image/video processing primitives         |  |
| `--with-librist`        | Reliable Internet Stream Transport                        |  |
| `--with-librsvg`        | SVG files as inputs                                       |  |
| `--with-libsoxr`        | The SoX resampling library                                |  |
| `--with-libssh`         | Support SFTP protocol                                     |  |
| `--with-tensorflow`     | TensorFlow for Deep Neural Network based filters          | You need to train your own model or source pre-trained models from elsewhere (modelzoo, openmodeldb or similar). For details see the notes in [the pull request](https://github.com/homebrew-ffmpeg/homebrew-ffmpeg/pull/172) |
| `--with-tesseract`      | An Optical Character Recognition (OCR) engine             |  |
| `--with-libvidstab`     | Video stabilization library                               |  |
| `--with-openal-soft`    | OpenAL (Open Audio Library) for macOS targets             |  |
| `--with-openapv`        | OpenAPV (Open Advanced Professional Video Codec)          |  |
| `--with-opencore-amr`   | Opencore AMR NR/WB audio format                           |  |
| `--with-openh264`       | OpenH264 library                                          |  |
| `--with-openjpeg`       | JPEG 2000 image format                                    |  |
| `--with-openssl`        | SSL support                                               |  |
| `--with-openvino`       | OpenVINO for Deep Neural Network based filters            |  |
| `--with-rav1e`          | AV1 encoding                                              |  |
| `--with-svt-av1`        | Scalable Video Technology for AV1 (encoder and decoder)   |  |
| `--with-rtmpdump`       | Dumping RTMP streams                                      |  |
| `--with-rubberband`     | Audio time-stretching and pitch-shifting                  |  |
| `--with-two-lame`       | MPEG Audio Layer 2 (MP2) encoder                          |  |
| `--with-webp`           | Encode WEBP images                                        |  |
| `--with-whisper-cpp`    | Enable OpenAI's Whisper speech recognition model          |  |
| `--with-xvid`           | XviD support (MPEG-4 Part 2 Encoder)                      |  |
| `--with-zeromq`         | Receive commands sent through a libzeromq client          |  |
| `--with-zimg`           | Image conversion library                                  |  |
| `--with-srt`            | Secure Reliable Transport library                         |  |
| `--with-libvmaf`        | VMAF video quality metric                                 |  |
| `--with-libxml2`        | XML parser and toolkit                                    |  |
| `--with-libzvbi`        | Decoding of DVB teletext pages and DVB teletext subtitles | The ZVBI library has to be installed **before** running the FFmpeg formula. It can be obtained [from this tap](https://github.com/LesCanauxDiscrets/homebrew-tap) via `brew tap lescanauxdiscrets/tap && brew install lescanauxdiscrets/tap/zvbi`.                                                                                          |

## Troubleshooting

In general, please note that we only provide support for current macOS versions that still receive security updates. Beta or pre-release versions as well as legacy versions are not supported.

When installing a piece of SOFTWARE which is using this FFmpeg distribution, then you may get the following error:

```bash
==> Installing dependencies for SOFTWARE: ffmpeg
Error: ffmpeg is already installed from homebrew-ffmpeg/ffmpeg!
Please `brew uninstall ffmpeg` first."
```

Here is a workaround:

```bash
brew uninstall ffmpeg
brew install SOFTWARE
brew uninstall --ignore-dependencies ffmpeg
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-YOUR-OPTIONS
```

## Issues

To report issues, please [file an issue on GitHub](https://github.com/homebrew-ffmpeg/homebrew-ffmpeg/issues). Please include the full command line you have tested and the full terminal output you got with. Please note that we will only be able to help with issues that are exclusive to this tap and for OS which are officially supported.

If the problem is reproducible with the `homebrew-core` version of `ffmpeg`, please file it [on their tracker](https://github.com/Homebrew/homebrew-core/).

## Maintainers

- Reto Kromer (`@retokromer`)
- Werner Robitza (`@slhck`)
