curl -SL https://github.com/rmjarvis/tmv/archive/v0.74.tar.gz \
    -o tmv-0.74.tar.gz \
    && tar xzf tmv-0.74.tar.gz \
    && cd tmv-0.74 \
    && scons PREFIX="@AUX_PREFIX@" \
    CXX="@CXX@" FLAGS="@CXXFLAGS@" \
    EXTRA_INCLUDE_PATH="@BLAS_INCLUDE@" \
    EXTRA_LIB_PATH=$(echo @BLAS@ | sed -e 's#-L\([^ ]*\).*#\1#') \
    LIBS="$(echo @BLAS@ | sed -e 's#-L\([^ ]*\)##' | sed -e 's#-l\([^ ]*\)#\1#g' | sed -e 's#-[^ ]*##g')" \
    FORCE_FBLAS=true \
    && scons PREFIX="@AUX_PREFIX@" install \
    && cd .. \
    && rm -rf tmv*

