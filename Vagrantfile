# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :shell, :inline => <<-eos
set -e

if ! find ~/last-apt-updated -not -mtime 1 >/dev/null; then
  apt-get update && touch ~/last-apt-updated
fi

apt-get -y upgrade
apt-get -y install --no-install-recommends \
  libreadline-dev               \
  libncursesw5-dev              \
  zlib1g-dev                    \
  libssl-dev                    \
  sharutils                     \
  libbz2-dev                    \
  locales                       \
  libsqlite3-dev                \
  libffi-dev                    \
  mime-support                  \
  netbase                       \
  lsb-release                   \
  bzip2                         \
  libgdbm-dev                   \
  build-essential               \
  libssl-dev                    \
  devscripts                    \
  ruby-full                     \
  rubygems                      \
  # Intentionally left blank.

  eos

end
