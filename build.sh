# location to put built OpenOCD
PREFIX=/c/OpenOCD

# use 8 jobs
PARALLEL=-j8

# echo "# ==============================================================="
# echo "# openocd bootstrap"
#
# ./bootstrap
#
# echo "# ==============================================================="
# echo "# configuring openocd"
#
# ./configure --prefix=${PREFIX} \
#     --enable-static \
#     --disable-shared \
#     --disable-gccwarnings \
#     --enable-remote-bitbang \
#     --enable-internal-jimtcl \
#     --disable-internal-libjaylink
#
# echo "# ==============================================================="
# echo "# building openocd"
#
# make ${PARALLEL}
#
# echo "# ==============================================================="
# echo "# installing openocd"
#
# make install

echo "# ==============================================================="
echo "# copying shared libs (windows)"

set -xe

cp /mingw64/bin/libusb-1.0.dll ${PREFIX}/bin/libusb-1.0.dll
cp /mingw64/bin/libusb-0-1-4.dll ${PREFIX}/bin/libusb-0-1-4.dll
cp /mingw64/bin/libhidapi-0.dll ${PREFIX}/bin/libhidapi-0.dll
cp /mingw64/bin/libjaylink-0.dll ${PREFIX}/bin/libjaylink-0.dll
cp /mingw64/bin/libftdi1.dll ${PREFIX}/bin/libftdi1.dll
