let
  pkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-25.11.tar.gz";
  }) {};

  llvmPkgs = pkgs.llvmPackages_19;
in

pkgs.mkShell {
  name = "rpcs3-dev";

  nativeBuildInputs = [ pkgs.autoPatchelfHook ];

  buildInputs = with pkgs; [
    git
    cmake
    ninja

    llvmPkgs.clang
    llvmPkgs.llvm
    llvmPkgs.libcxx
    llvmPkgs.lld
    llvmPkgs.bintools

    libusb1
    libcap
    pulseaudio
    alsa-lib
    pipewire
    libevdev
    shaderc
    abseil-cpp
    gccNGPackages_15.libatomic

    pkg-config

    qt6.qtbase
    qt6.qttools
    qt6.qtmultimedia

    vulkan-loader
    vulkan-headers
    vulkan-tools

    ffmpeg
    python3

    glslang
    spirv-tools
    libunwind

    sdl3
    openal
    glew
    curl
    opencv
  ];

  shellHook = ''
    export CC=${llvmPkgs.clang}/bin/clang
    export CXX=${llvmPkgs.clang}/bin/clang++
    export AR=${llvmPkgs.llvm}/bin/llvm-ar
    export RANLIB=${llvmPkgs.llvm}/bin/llvm-ranlib
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
    pkgs.libevdev
    pkgs.systemd
    pkgs.sdl3
    pkgs.vulkan-loader
    pkgs.openal
    pkgs.zlib
    pkgs.curl
    pkgs.xorg.libX11
    pkgs.libGL
    pkgs.libGLU
    pkgs.glew
    pkgs.abseil-cpp
    pkgs.alsa-lib
    pkgs.qt6.qtbase
    pkgs.qt6.qttools
    pkgs.qt6.qtmultimedia
    pkgs.qt6.qtsvg
    pkgs.libxkbcommon
    pkgs.opencv
    pkgs.stdenv.cc.cc.lib
    llvmPkgs.llvm
  ]}
  '';
}
