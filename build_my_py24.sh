#!/bin/sh
set -e
set -v

MY_PY24_VERSION=1.0.0

FPM=/var/lib/gems/1.8/bin/fpm
[ -x $FPM ] || gem install fpm

MY_PY24_DEB=/vagrant/my-py24_${MY_PY24_VERSION}_amd64.deb

if ! [ -f ${MY_PY24_DEB} ]; then
  cd /tmp
  rm -fr Python-2.4.6
  tar xf /vagrant/Python-2.4.6.tar.xz
  cd Python-2.4.6
  ./configure --prefix=/opt/my-py24
  make -j 3
  make install DESTDIR=$(pwd)/DEST

  cd /vagrant
  $FPM                                        \
    -s dir -t deb                             \
    -n my-py24                                \
    -v ${MY_PY24_VERSION}                     \
    -d 'libgdbm3'                             \
    -d 'libbz2-1.0'                           \
    -d 'libc6'                                \
    -d 'libncurses5'                          \
    -d 'libncursesw5'                         \
    -d 'libreadline6'                         \
    -d 'libssl0.9.8'                          \
    -d 'zlib1g'                               \
    -C /tmp/Python-2.4.6/DEST                 \
    --description "A Python2.4 just for me."  \
    opt/my-py24
fi

[ -x /opt/my-py24/bin/python ] || dpkg -i ${MY_PY24_DEB}
