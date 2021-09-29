PKG_NAME="uae4arm"
PKG_VERSION="4dd61d2"
PKG_ARCH="arm"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/Chips-fr/uae4arm-rpi"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain flac mpg123 zlib"
PKG_SHORTDESC="Port of uae4arm for libretro (rpi/android)"
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="-f Makefile.libretro"

if target_has_feature neon ; then
  PKG_MAKE_OPTS_TARGET+=" platform=unix-neon"
else
  PKG_MAKE_OPTS_TARGET+=" platform=unix"
fi

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
    cp -v uae4arm_libretro.so ${INSTALL}/usr/lib/libretro/
    cp -v capsimg.so ${INSTALL}/usr/lib/
}