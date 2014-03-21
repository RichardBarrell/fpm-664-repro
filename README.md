It's all broken:

    # Get a clean Ubuntu 10.04 virtual machine to test this on:
    vagrant up

    # Log into it.
    vagrant ssh

    # Become root.
    sudo -i

    # This works.
    sh /vagrant/build_my_py24.sh

    # This doesn't.
    sh /vagrant/build_my_py24_setuptools.sh
