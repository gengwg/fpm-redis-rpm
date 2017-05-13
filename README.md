# fpm-redis-rpm

Building Redis RPM using a Centos 7 Vagrant box.

## Building

    vagrant up

After some minutes, you will find the Redis rpm in your current directory, e.g. `redis-3.2.8-4.x86_64.rpm`.

## Usage

This RPM can be used to start a 6-node (default) Redis cluster on a single host, with each Redis node running on a separate port, which may be good for demo or learning Redis clustering.

For production, one can modify it to install `N` Redis nodes on each of `M` hosts, and make them an `N*M`-node Redis cluster. For example, a `4*8` 32-node cluster.
