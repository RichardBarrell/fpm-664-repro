#!/bin/sh
set -e
set -v

MY_PY24_setuptools_VERSION=1.0.0

FPM=/var/lib/gems/1.8/bin/fpm
[ -x $FPM ] || gem install fpm

MY_PY24_setuptools_DEB=/vagrant/my-py24-setuptools_${MY_PY24_VERSION}_amd64.deb

if ! [ -f ${MY_PY24_setuptools_DEB} ]; then
  cd /tmp
  rm -fr setuptools-0.6c11
  tar xf /vagrant/setuptools-0.6c11.tar.xz
  $FPM                                                            \
    -s python -t deb                                              \
    -n my-py24-setuptools                                         \
    -v ${MY_PY24_setuptools_VERSION}                              \
    -d 'my-py24'                                                  \
    --python-bin /opt/my-py24/bin/python                          \
    --no-python-fix-name                                          \
   --python-install-bin /opt/my-py24/bin                          \
   --python-install-lib /opt/my-py24/lib/python2.4/site-packages  \
   --description "setuptools 0.6c11 just for me"                  \
   /tmp/setuptools-0.6c11
fi

[ -x /opt/my-py24/lib/python2.4/setuptools ] || dpkg -i ${MY_PY24_setuptools_DEB}
