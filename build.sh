# location to put built OpenOCD
PREFIX=/c/OpenOCD

# use 8 jobs
PARALLEL=-j8

# additional libs

BASE=`pwd`
ARTIFACTS=${BASE}/artifacts

mkdir -p artifacts
pushd artifacts

if [ ! -f libsetupapi.a ]; then
    wget https://github.com/msysgit/msysgit/raw/master/mingw/lib/libsetupapi.a
fi

popd

# using mingw-w64-x86_64-hidapi-0.9.0-1-any from MSYS
# pacman -Syy
# pacman -Scc
# pacman -Suu

echo "# ==============================================================="
echo "# openocd bootstrap"

./bootstrap

rm -rf build
mkdir -p build

echo "# ==============================================================="
echo "# configuring openocd"

./configure --prefix=${PREFIX} \
    --enable-static \
    --disable-shared \
    --disable-gccwarnings \
    --enable-remote-bitbang \
    --enable-internal-jimtcl \
    --disable-internal-libjaylink \
    --enable-stlink \
    CFLAGS="-O2 -fomit-frame-pointer --static -I${PREFIX}/include" \
    LDFLAGS="--static ${ARTIFACTS}/libsetupapi.a -L${PREFIX}/lib"

echo "# ==============================================================="
echo "# building openocd"

make ${PARALLEL}
make install
