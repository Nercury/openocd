# location to put built OpenOCD
PREFIX=~/openocd

# use 8 jobs
PARALLEL=-j8

echo "# ==============================================================="
echo "# openocd bootstrap"

./bootstrap

echo "# ==============================================================="
echo "# configuring openocd"

./configure --prefix=${PREFIX} \
    --enable-static \
    --disable-shared \
    --disable-gccwarnings \
    --enable-remote-bitbang \
    --enable-internal-jimtcl \
    --disable-internal-libjaylink \
    --disable-cmsis-dap

echo "# ==============================================================="
echo "# building openocd"

make ${PARALLEL}

echo "# ==============================================================="
echo "# installing openocd"

make install
