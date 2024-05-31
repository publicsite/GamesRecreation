#!/bin/sh

thepwd="$PWD"

#make a copy of keeperfx directory for backup
cp -a keeperfx keeperfx.bak

#first build SDL

mkdir -p keeperfx/sdl/for_final_package

find . -maxdepth 1 -type f -name "SDL2*.tar.gz" -exec tar -xf "{}" \;

cd SDL2-2.30.3
./configure --enable-static --target="i686-w64-mingw32" --host="i686-w64-mingw32" --build="x86_64-linux" --prefix=/usr/i686-w64-mingw32 ac_cv_header_sys_types_h=no
make
mkdir "${thepwd}/SDL-installation"
make DESTDIR="${thepwd}/SDL-installation" install
cd ..

cd SDL2_net-2.2.0
./configure --enable-static --target="i686-w64-mingw32" --host="i686-w64-mingw32" --build="x86_64-linux" --prefix=/usr/i686-w64-mingw32
sed -i "s%CFLAGS = -g -O2 -I/usr/include/SDL2 -D_REENTRANT  -Wall%CFLAGS = -g -O2 -I${thepwd}/SDL2-2.30.3/include -D_REENTRANT  -Wall%g" Makefile
sed -i "s%^LDFLAGS = %LDFLAGS = -L${thepwd}/SDL2-2.30.3/build/.libs%g" Makefile
sed -i 's%^LIBS =  -lSDL2%LIBS =  -lmingw32 -lSDL2main -lSDL2%g' Makefile
sed -i 's%^SDL_LIBS = -lSDL2 %SDL_LIBS =  -lmingw32 -lSDL2main -lSDL2%g' Makefile
make
mkdir "${thepwd}/SDL_net-installation"
make DESTDIR="${thepwd}/SDL_net-installation" install
cd ..

cd SDL2_mixer-2.8.0
sed -i "s%cross_compiling=no%cross_compiling=yes%g" configure
sed -i 's%as_fn_append ac_header_c_list " sys/types.h sys_types_h HAVE_SYS_TYPES_H"%%g' configure
CFLAGS="-nostdinc -I/usr/i686-w64-mingw32/include -I/usr/lib/gcc/i686-w64-mingw32/12-win32/include -I${thepwd}/SDL2-2.30.3/include" LDFLAGS="-L${thepwd}/SDL2-2.30.3/build/.libs" ./configure --enable-static --target="i686-w64-mingw32" --host="i686-w64-mingw32" --build="x86_64-linux" --prefix=/usr/i686-w64-mingw32 ac_cv_header_sys_types_h=no enable_music_midi_fluidsynth=no enable_music_opus=no
sed -i 's%^SDL_LIBS = -lSDL2 %SDL_LIBS = -lmingw32 -lSDL2main -lSDL2%g' Makefile
make
mkdir "${thepwd}/SDL_mixer-installation"
make DESTDIR="${thepwd}/SDL_mixer-installation" install
cd ..

cd SDL2_image-2.8.2
CFLAGS="-nostdinc -I/usr/i686-w64-mingw32/include -I/usr/lib/gcc/i686-w64-mingw32/12-win32/include -I${thepwd}/SDL2-2.30.3/include" LDFLAGS="-L${thepwd}/SDL2-2.30.3/build/.libs" ./configure --enable-static --target="i686-w64-mingw32" --host="i686-w64-mingw32" --build="x86_64-linux" --prefix=/usr/i686-w64-mingw32 ac_cv_header_sys_types_h=no \
ac_cv_header_tiffio_h=no \
enable_tif=no enable_imageio=no \
have_webpdemux_hdr=no ave_webpdemux_lib=no \
have_webp_hdr=no \
have_webp_lib=no \
ac_cv_header_webp_demux_h=no \
ac_cv_lib_webpdemux_WebPDemuxGetFrame=no \
ac_cv_lib_webp_WebPGetDecoderVersion=no \
ac_cv_header_webp_decode_h=no
sed -i 's%^SDL_LIBS = -lSDL2 %SDL_LIBS = -lmingw32 -lSDL2main -lSDL2%g' Makefile
sed -i 's% -I/usr/include/x86_64-linux-gnu %%g' Makefile
sed -i 's% -DLOAD_WEBP=1%%g' Makefile
sed -i 's%have_webpdemux_lib=yes%have_webpdemux_lib=no%g' Makefile
sed -i 's%LIBWEBPDEMUX_LIBS="-lwebpdemux"%LIBWEBPDEMUX_LIBS=""%g' Makefile
sed -i 's%LIBS="-lwebpdemux -lm $LIBS"%LIBS="-lm $LIBS"%g' Makefile
sed -i 's%have_webp_lib=yes%have_webp_lib=no%g' Makefile
sed -i 's%LIBWEBP_LIBS="-lwebp"%LIBWEBP_LIBS=""%g' Makefile
sed -i 's%LIBS="-lwebp -lm $LIBS"%LIBS="-lm $LIBS"%g' Makefile
sed -i 's%IMG_LIBS = -lwebpdemux -lwebp  -lwebp  %IMG_LIBS = %g' Makefile
sed -i 's%LIBWEBPDEMUX_LIBS = -lwebpdemux -lwebp %LIBWEBPDEMUX_LIBS = %g' Makefile
sed -i 's%-I/usr/include/SDL2 %%g' Makefile
sed -i 's%^LIBS =  -lSDL2 %LIBS =  -lmingw32 -lSDL2main -lSDL2%g' Makefile
make \
ac_cv_header_tiffio_h=no \
enable_tif=no enable_imageio=no \
have_webpdemux_hdr=no ave_webpdemux_lib=no \
have_webp_hdr=no \
have_webp_lib=no \
ac_cv_header_webp_demux_h=no \
ac_cv_lib_webpdemux_WebPDemuxGetFrame=no \
ac_cv_lib_webp_WebPGetDecoderVersion=no \
ac_cv_header_webp_decode_h=no
mkdir "${thepwd}/SDL_image-installation"
make DESTDIR="${thepwd}/SDL_image-installation" install
cd ..

mkdir -p keeperfx/sdl/for_final_package/
cp -a SDL-installation/usr/i686-w64-mingw32/bin/* keeperfx/sdl/for_final_package/
cp -a SDL-installation/usr/i686-w64-mingw32/include keeperfx/sdl/
cp -a SDL-installation/usr/i686-w64-mingw32/lib keeperfx/sdl/

cp -a SDL_net-installation/usr/i686-w64-mingw32/bin/* keeperfx/sdl/for_final_package/
cp -a SDL_net-installation/usr/i686-w64-mingw32/include/* keeperfx/sdl/include/
cp -a SDL_net-installation/usr/i686-w64-mingw32/lib/* keeperfx/sdl/lib/

cp -a SDL_mixer-installation/usr/i686-w64-mingw32/bin/* keeperfx/sdl/for_final_package/
cp -a SDL_mixer-installation/usr/i686-w64-mingw32/include/* keeperfx/sdl/include/
cp -a SDL_mixer-installation/usr/i686-w64-mingw32/lib/* keeperfx/sdl/lib/

cp -a SDL_image-installation/usr/i686-w64-mingw32/bin/* keeperfx/sdl/for_final_package/
cp -a SDL_image-installation/usr/i686-w64-mingw32/include/* keeperfx/sdl/include/
cp -a SDL_image-installation/usr/i686-w64-mingw32/lib/* keeperfx/sdl/lib/

#then build keeperfx


cd keeperfx

rm libexterns.mk
rm prebuilds.mk

patch -p1 < ../DK-we-use-our-own-sdl.patch

patch -p1 < ../DK-we-use-our-own-dkillconv.patch #not availiable for linux
patch -p1 < ../DK-we-use-our-own-png2bestpal.patch #tools/png2bestpal
patch -p1 < ../DK-we-use-our-own-png2ico.patch #tools/png2ico
patch -p1 < ../DK-we-use-our-own-pngpal2raw.patch #tools/pngpal2raw
patch -p1 < ../DK-we-use-our-own-po2ngdat.patch #tools/po2ngdat
patch -p1 < ../DK-we-use-our-own-sndbanker.patch #tools/sndbanker
patch -p1 < ../DK-we-use-our-own-rnctools.patch #tools/rnctools

mkdir tools

cd tools

tar -xf ../../png2bestpal_v1.0.3.tar.gz
tar -xf ../../png2ico_2003-01-14.tar.gz
tar -xf ../../pngpal2raw_v1.0.2.tar.gz
tar -xf ../../po2ngdat_v1.0.2.31.tar.gz
tar -xf ../../sndbanker_v1.0.1.tar.gz
tar -xf ../../rnctools_v1.0.2.tar.gz

mv png2bestpal* png2bestpal
mv png2ico* png2ico
mv pngpal2raw* pngpal2raw
mv po2ngdat* po2ngdat
mv sndbanker* sndbanker
mv rnctools* rnctools

cd ..

mkdir tempinclude
touch tempinclude/io.h

make

cd bin

#install
if [ ! -d ".wine/drive_c/keeperfx" ]; then
	mkdir -p ".wine/drive_c/keeperfx"
	cd ".wine/drive_c/keeperfx"
	find ${thepwd}/keeperfx/bin -type f -maxdepth 1 -exec ln "{}" \;
	cp -a ${thepwd}/keeperfx/config/keeperfx.cfg .
	sed -i 's%INSTALL_PATH=./%INSTALL_PATH=C:\\\keeperfx%g' keeperfx.cfg
	cp -a ${thepwd}/keeperfx/sdl/for_final_package/SDL2.dll .
	cp -a ${thepwd}/keeperfx/sdl/for_final_package/sdl2-config .
	cp -a ${thepwd}/keeperfx/sdl/for_final_package/SDL2_image.dll .
	cp -a ${thepwd}/keeperfx/sdl/for_final_package/SDL2_mixer.dll .
	cp -a ${thepwd}/keeperfx/sdl/for_final_package/SDL2_net.dll .
	cp -a /usr/lib/gcc/i686-w64-mingw32/12-win32/libgcc_s_dw2-1.dll .
	cp -a ${thepwd}/config/keeperfx.cfg .
	cp -a "${thepwd}/keeperfx/config/fxdata" .
	cp -a "${thepwd}/keeperfx/config/creatrs" .
	cp -a "${thepwd}/keeperfx/campgns" .
	cp -a "${thepwd}/keeperfx/levels" .
	mkdir music
	mkdir save
	mkdir scrshots
	mkdir data
	mkdir sound

	cp -a "${thepwd}/missing-sources/launch.sh" .
	cp -a "${thepwd}/missing-sources/launchermn.jpg" .
	cp -a "${thepwd}/missing-sources/launcher.exe" .
	find "${thepwd}/missing-sources/data" -exec cp -a {} data/ \;
	find "${thepwd}/missing-sources/fxdata" -exec cp -a {} fxdata/ \;
fi

