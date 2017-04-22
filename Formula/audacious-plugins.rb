class AudaciousPlugins < Formula
  desc "Free and advanced audio player based on GTK+"
  homepage "http://audacious-media-player.org"
  url "http://distfiles.audacious-media-player.org/audacious-plugins-3.8.2.tar.bz2"
  sha256 "d7cefca7a0e32bf4e58bb6e84df157268b5e9a6771a0e8c2da98b03f92a5fdd4"

  depends_on "audacious"
  depends_on "make"
  depends_on "automake"
  depends_on "autoconf"
  depends_on "gettext"
  depends_on "neon"
  depends_on "mpg123"
  depends_on "sdl2"
  depends_on "wavpack"
  depends_on "glib"
  depends_on "dbus"
  depends_on "gtk+"
  depends_on "ffmpeg"
  depends_on "libnotify"
  depends_on "libvorbis"
  depends_on "lame"
  depends_on "fluidsynth"
  depends_on "faad2"
  depends_on "flac"
  depends_on :python

  def install
    inreplace "configure", "plugindir=`pkg-config audacious --variable=plugin_dir`", "plugindir=#{prefix}/lib/audacious"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test audacious`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
