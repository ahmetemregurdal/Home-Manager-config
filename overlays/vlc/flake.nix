{
  description = "A Nix flake for building an optimized VLC 4 from source.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, flake-utils}:
    flake-utils.lib.eachDefaultSystem (system:
      let
				lib = inputs.nixpkgs.lib;
        pkgs = nixpkgs.legacyPackages.${system};
        vlc4-src = pkgs.fetchgit {
					leaveDotGit = true;
          url = "https://code.videolan.org/videolan/vlc.git";
          rev = "65f66c82bf35571e6096a434a0015b0ccc01ec5f"; # VLC 4 development branch
          sha256 = "TLCYiTiaH0MJHZCQk9jIh7BFMYyLZ8C+q5ziyXiKW0A="; # Placeholder
        };
      in
      {
        packages.vlc-optimized = pkgs.stdenv.mkDerivation rec {
          pname = "vlc-optimized";
          version = "4.0.0-20251121";

					VLC_GIT_REVISION = "${vlc4-src.rev}";

          src = vlc4-src;

					dontStrip = true;
					__darwinAllowVCS = true;

					BUILDCC = "${pkgs.buildPackages.gcc}/bin/gcc";

          nativeBuildInputs = with pkgs; [
            pkgs.qt5.wrapQtAppsHook
            autoconf
            automake
            libtool
            pkg-config
            gettext
            bison
						git
            flex
            cmake # VLC 4 uses meson/cmake for some parts, but autotools is still primary for core

            yasm
          ];


					buildInputs = with pkgs; [
						a52dec
						alsa-lib
						avahi
						cairo
						dbus
						faad2
						ffmpeg_6
						flac
						fluidsynth
						fontconfig
						freetype
						fribidi
						gnutls
						harfbuzz
						libGL
						xorg.libSM
						libarchive
						libass
						libbluray
						libcaca
						libcddb
						libdc1394
						libdvbpsi
						libdvdnav
						libdvdnav.libdvdread
						libebml
						libgcrypt
						libgpg-error
						libjpeg
						libkate
						libmad
						libmatroska
						libmodplug
						libmpeg2
						libmtp
						libogg
						libopus
						libplacebo_5
						libpng
						libpulseaudio
						librsvg
						libsamplerate
						libspatialaudio
						libssh2
						libtheora
						libtiger
						libupnp
						libv4l
						libva
						libvorbis
						libxml2
						lua5
						ncurses
						samba
						schroedinger
						speex
						srt
						systemdLibs
						taglib_1
						xorg.xcbutilkeysyms
						zlib
					];

					buildSystem = "autotools";

					enableParallelBuilding = true;
					dontWrapGApps = true;

          extraConfigureFlags = [
						"--disable-vlc"
						"--localedir=${placeholder "out"}/share/locale"
						"--datadir=${placeholder "out"}/share"
						"--datarootdir=${placeholder "out"}/share"
						"--prefix=${placeholder "out"}"
						"--libdir=${placeholder "out"}/lib"
						"--disable-doc"
						"--disable-appdata"
						"--disable-hicolor-icon-install"
          ];

					configurePhase = ''
						./bootstrap
						./configure $configureFlags ${lib.concatStringsSep " " extraConfigureFlags}
					'';

					postPatch = ''
						sed -i 's|/usr/local/share/metainfo|${placeholder "out"}/share/metainfo|g' share/Makefile.am
					'';

					preBuild = ''
						echo "${VLC_GIT_REVISION}" > revision.txt
						echo "${VLC_GIT_REVISION}" > src/revision.txt
					'';

					installFlags = [
						"pkglibdir=${placeholder "out"}/lib/vlc"
						"datadir=${placeholder "out"}/share"
						"icondir=${placeholder "out"}/share/icons"
						"pkglibexecdir=${placeholder "out"}/libexec/vlc"
						"libexecdir=${placeholder "out"}/libexec"
						"bindir=${placeholder "out"}/bin"
						"metainfodir=${placeholder "out"}/share/metainfo"
					  "docdir=${placeholder "out"}/share/doc/${pname}-${version}"
						"desktopdir=${placeholder "out"}/share/applications"
					];

					meta = {
						description = "Cross-platform media player and streaming server";
						homepage = "https://www.videolan.org/vlc/";
						license = lib.licenses.lgpl21Plus;
						platforms = lib.platforms.linux;
						mainProgram = "vlc";
					};

        };
      }
    );
}
