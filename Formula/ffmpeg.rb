class Ffmpeg < Formula
  desc "Play, record, convert, and stream audio and video"
  homepage "https://ffmpeg.org/"
  url "https://ffmpeg.org/releases/ffmpeg-5.0.tar.xz"
  version "5.0-with-options" # to distinguish from homebrew-core's ffmpeg
  sha256 "51e919f7d205062c0fd4fae6243a84850391115104ccf1efc451733bc0ac7298"
  license "GPL-2.0-or-later"
  revision 1
  head "https://github.com/FFmpeg/FFmpeg.git"

  option "with-libaom", "Enable AV1 video streams"
  option "with-libdav1d", "Enable AV1 decoder"
  option "with-libfontconfig", "Enable fontconfig"
  option "with-libfreetype", "Enable freetype fonts"
  option "with-frei0r", "Enable video effecs"
  option "with-libass", "Enable renderer for the ASS/SSA subtitle format"
  option "with-libvorbis", "Enable vorbis audio codec"
  option "with-libopus", "Enable opus audio codec"
  option "with-libtheora", "Enable theora video codec"

  option "with-chromaprint", "Enable the Chromaprint audio fingerprinting library"
  option "with-decklink", "Enable DeckLink support"
  option "with-fdk-aac", "Enable the Fraunhofer FDK AAC library"
  option "with-game-music-emu", "Enable Game Music Emu (GME) support"
  option "with-jack", "Enable Jack support"
  option "with-libmodplug", "Enable module/tracker files as inputs via libmodplug"
  option "with-libopenmpt", "Enable module/tracker files as inputs via libopenmpt"
  option "with-librist", "Enable Reliable Internet Stream Transport (RIST) support"
  option "with-librsvg", "Enable SVG files as inputs via librsvg"
  option "with-libsoxr", "Enable the soxr resample library"
  option "with-libssh", "Enable SFTP protocol via libssh"
  option "with-tesseract", "Enable the tesseract OCR engine"
  option "with-libvidstab", "Enable vid.stab support for video stabilization"
  option "with-opencore-amr", "Enable Opencore AMR NR/WB audio format"
  option "with-openh264", "Enable OpenH264 library"
  option "with-openjpeg", "Enable JPEG 2000 image format"
  option "with-openssl", "Enable SSL support"
  option "with-rav1e", "Enable AV1 encoding via librav1e"
  option "with-rtmpdump", "Enable RTMP dumping support"
  option "with-rubberband", "Enable rubberband library"
  option "with-webp", "Enable using libwebp to encode WEBP images"
  option "with-zeromq", "Enable using libzeromq to receive cmds sent through a libzeromq client"
  option "with-zimg", "Enable z.lib zimg library"
  option "with-srt", "Enable SRT library"
  option "with-libvmaf", "Enable libvmaf scoring library"
  option "with-libxml2", "Enable libxml2 library"

  depends_on "nasm" => :build
  depends_on "pkg-config" => :build
  depends_on "texinfo" => :build

  depends_on "lame"
  depends_on "libvpx"
  depends_on "sdl2"
  depends_on "snappy"
  depends_on "x264"
  depends_on "x265"
  depends_on "xz"

  depends_on "aom" => :optional
  depends_on "dav1d" => :optional
  depends_on "fontconfig" => :optional
  depends_on "freetype" => :optional
  depends_on "frei0r" => :optional
  depends_on "libass" => :optional
  depends_on "libvorbis" => :optional
  depends_on "opus" => :optional
  depends_on "theora" => :optional

  depends_on "fdk-aac" => :optional
  depends_on "game-music-emu" => :optional
  depends_on "jack" => :optional
  depends_on "libbluray" => :optional
  depends_on "libbs2b" => :optional
  depends_on "libcaca" => :optional
  depends_on "libgsm" => :optional
  depends_on "libmodplug" => :optional
  depends_on "libopenmpt" => :optional
  depends_on "librist" => :optional
  depends_on "librsvg" => :optional
  depends_on "libsoxr" => :optional
  depends_on "libssh" => :optional
  depends_on "libvidstab" => :optional
  depends_on "libvmaf" => :optional
  depends_on "libxml2" => :optional
  depends_on "opencore-amr" => :optional
  depends_on "openh264" => :optional
  depends_on "openjpeg" => :optional
  depends_on "openssl@1.1" => :optional
  depends_on "rav1e" => :optional
  depends_on "rtmpdump" => :optional
  depends_on "rubberband" => :optional
  depends_on "speex" => :optional
  depends_on "srt" => :optional
  depends_on "tesseract" => :optional
  depends_on "two-lame" => :optional
  depends_on "webp" => :optional
  depends_on "xvid" => :optional
  depends_on "zeromq" => :optional
  depends_on "zimg" => :optional

  uses_from_macos "bzip2"
  uses_from_macos "zlib"

  on_linux do
    depends_on "libxv"
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --enable-shared
      --cc=#{ENV.cc}
      --host-cflags=#{ENV.cflags}
      --host-ldflags=#{ENV.ldflags}
      --enable-gpl
      --enable-libmp3lame
      --enable-libsnappy
      --enable-libvpx
      --enable-libx264
      --enable-libx265
      --enable-demuxer=dash
    ]

    if OS.mac?
      args << "--enable-opencl"
      args << "--enable-videotoolbox"
      args << "--enable-neon" if Hardware::CPU.arm?
    end

    args << "--disable-htmlpages" # The same info is accessible through the man pages.

    args << "--enable-libaom" if build.with? "libaom"
    args << "--enable-libdav1d" if build.with? "libdav1d"
    args << "--enable-libopus" if build.with? "libopus"
    args << "--enable-libtheora" if build.with? "libtheora"
    args << "--enable-libvorbis" if build.with? "libvorbis"
    args << "--enable-libfontconfig" if build.with? "libfontconfig"
    args << "--enable-libfreetype" if build.with? "libfreetype"
    args << "--enable-frei0r" if build.with? "frei0r"
    args << "--enable-libass" if build.with? "libass"
    args << "--enable-libvmaf" if build.with? "libvmaf"

    args << "--enable-chromaprint" if build.with? "chromaprint"
    args << "--enable-libbluray" if build.with? "libbluray"
    args << "--enable-libbs2b" if build.with? "libbs2b"
    args << "--enable-libcaca" if build.with? "libcaca"
    args << "--enable-libfdk-aac" if build.with? "fdk-aac"
    args << "--enable-libgme" if build.with? "game-music-emu"
    args << "--enable-libgsm" if build.with? "libgsm"
    args << "--enable-libmodplug" if build.with? "libmodplug"
    args << "--enable-libopenh264" if build.with? "openh264"
    args << "--enable-libopenjpeg" if build.with? "openjpeg"
    args << "--enable-libopenmpt" if build.with? "libopenmpt"
    args << "--enable-librav1e" if build.with? "rav1e"
    args << "--enable-librist" if build.with? "librist"
    args << "--enable-librsvg" if build.with? "librsvg"
    args << "--enable-librtmp" if build.with? "rtmpdump"
    args << "--enable-librubberband" if build.with? "rubberband"
    args << "--enable-libsoxr" if build.with? "libsoxr"
    args << "--enable-libspeex" if build.with? "speex"
    args << "--enable-libsrt" if build.with? "srt"
    args << "--enable-libssh" if build.with? "libssh"
    args << "--enable-libtesseract" if build.with? "tesseract"
    args << "--enable-libtwolame" if build.with? "two-lame"
    args << "--enable-libvidstab" if build.with? "libvidstab"
    args << "--enable-libvmaf" if build.with? "libvmaf"
    args << "--enable-libwebp" if build.with? "webp"
    args << "--enable-libxml2" if build.with? "libxml2"
    args << "--enable-libxvid" if build.with? "xvid"
    args << "--enable-libzimg" if build.with? "zimg"
    args << "--enable-libzmq" if build.with? "zeromq"
    args << "--enable-openssl" if build.with? "openssl"

    # These librares are GPL-incompatible, and require ffmpeg be built with
    # the "--enable-nonfree" flag, which produces unredistributable libraries
    args << "--enable-nonfree" if build.with?("decklink") || build.with?("fdk-aac") || build.with?("openssl")

    if build.with? "decklink"
      args << "--enable-decklink"
      args << "--extra-cflags=-I#{HOMEBREW_PREFIX}/include"
      args << "--extra-ldflags=-L#{HOMEBREW_PREFIX}/include"
    end

    if build.with? "jack"
      ENV.prepend_path "PKG_CONFIG_PATH", Formula["jack"].opt_lib/"pkgconfig"
      args << "--enable-libjack"
      args << "--enable-indev=jack"
    end

    args << "--enable-version3" if build.with?("opencore-amr") || build.with?("libvmaf")

    if build.with? "opencore-amr"
      args << "--enable-libopencore-amrnb"
      args << "--enable-libopencore-amrwb"
    end

    if build.with? "libvmaf"
      # Replace hardcoded default VMAF model path
      %w[doc/filters.texi libavfilter/vf_libvmaf.c].each do |f|
        inreplace f, "/usr/local/share/model", HOMEBREW_PREFIX/"share/libvmaf/model"
        # Since libvmaf v2.0.0, `.pkl` model files have been deprecated in favor of `.json` model files.
        inreplace f, "vmaf_v0.6.1.pkl", "vmaf_v0.6.1.json"
      end
    end

    system "./configure", *args
    system "make", "install"

    # Build and install additional FFmpeg tools
    system "make", "alltools"
    bin.install Dir["tools/*"].select { |f| File.executable? f }
    mv bin/"python", pkgshare/"python", force: true

    if build.with? "tesseract"
      opoo <<~EOS
        The default `tesseract` dependency includes limited language support.
        To add all supported languages, install the `tesseract-lang` formula.
      EOS
    end
  end

  test do
    # Create an example mp4 file
    mp4out = testpath/"video.mp4"
    system bin/"ffmpeg", "-filter_complex", "testsrc=rate=1:duration=1", mp4out
    assert_predicate mp4out, :exist?
  end
end
