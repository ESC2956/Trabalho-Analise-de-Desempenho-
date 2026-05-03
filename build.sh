set -e

nix-shell --run '
if [ -d "rpcs3-perf" ]; then
    echo "Updating RPCS3-perf"
    cd rpcs3-perf
    git pull
    git submodule update --init
else
    echo "Cloning RPCS3-perf"
    git clone https://github.com/victfv/rpcs3-perf.git
    cd rpcs3-perf
    git submodule update --init
fi

if [ -d "build" ]; then
    echo "Removing RPCS3 Build directory"
    rm -rf build
fi

unset NIX_ENFORCE_NO_NATIVE
export LDFLAGS="-latomic"

cmake -B build -G Ninja \
-DCMAKE_COMPILE_WARNING_AS_ERROR=OFF \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_CXX_COMPILER=clang++ \
-DCMAKE_C_COMPILER=clang \
-Dprotobuf_HAVE_BUILTIN_ATOMICS=ON \
-DCMAKE_CXX_SCAN_FOR_MODULES=OFF \
--compile-no-warning-as-error \
-DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" \
-DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld" \
-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON

cmake --build build
'
