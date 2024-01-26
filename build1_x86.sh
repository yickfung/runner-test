#!/bin/sh

set -eu

LOCAL_PREFIX="/tmp/local_x86"

rm -rf gettext-0.22.4
tar zxf gettext-0.22.4.tar.gz
cd gettext-0.22.4
./configure --prefix=$LOCAL_PREFIX
make && make install
cd ..

rm -rf openssl-1.1.1u
tar zxf openssl-1.1.1u.tar.gz
cd openssl-1.1.1u
./Configure darwin64-x86_64-cc --prefix=$LOCAL_PREFIX -shared
# ./Configure darwin64-arm64-cc --prefix=$LOCAL_PREFIX -shared
make && make install
cd ..

rm -rf xz-5.2.3
tar zxf xz-5.2.3.tar.gz
cd xz-5.2.3
./configure --prefix=$LOCAL_PREFIX
make && make install
cd ..

rm -rf gdbm-1.23
tar zxf gdbm-1.23.tar.gz
cd gdbm-1.23
./configure --prefix=$LOCAL_PREFIX --without-readline
make && make install
cd ..

rm -rf tcl8.6.11
tar zxf tcl8.6.11-src.tar.gz
cd tcl8.6.11/unix
./configure --prefix=$LOCAL_PREFIX
make && make install
cd ../..

rm -rf tk8.6.11
tar zxf tk8.6.11-src.tar.gz
cd tk8.6.11/unix
./configure --prefix=$LOCAL_PREFIX --with-tcl=../../tcl8.6.11/unix --enable-aqua
make && make install
cd ../..