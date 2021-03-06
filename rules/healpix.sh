curl -SL https://github.com/tskisner/healpix-autotools/releases/download/v3.31.2/healpix-autotools-3.31.2.tar.gz \
    -o healpix-autotools-3.31.2.tar.gz \
    && tar -xzf healpix-autotools-3.31.2.tar.gz \
    && cd healpix-autotools-3.31.2 \
    && CC="@CC@" CXX="@CXX@" FC="@FC@" \
    CFLAGS="@CFLAGS@" CXXFLAGS="@CXXFLAGS@" FCFLAGS="@FCFLAGS@" \
    ./configure @CROSS@ --with-cfitsio="@AUX_PREFIX@" --prefix="@AUX_PREFIX@" \
    && make && make install \
    && cd .. \
    && rm -rf healpix*
