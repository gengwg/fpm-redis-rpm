# fpm-redis-rpm

Build [Redis](https://redis.io/) RPM using a Centos 7 Vagrant box.

## Build

    vagrant up

After some minutes, you will find the Redis RPM in your current directory, e.g. `redis-3.2.8-4.x86_64.rpm`.

## Usage

This RPM can be used to start a 6-node (default) Redis cluster on a single host, with each Redis node running on a separate port, which may be good for demo or learning Redis clustering.

For production, one can modify it to install `N` Redis nodes on each of `M` hosts, and make them an `N*M`-node Redis cluster. For example, a `4*8` 32-node cluster.

## Troubleshooting


```bash
==> default: ERROR:  Could not find a valid gem 'fpm' (>= 0), here is why:
==> default:           Unable to download data from https://rubygems.org/ - Errno::ECONNRESET: Connection reset by peer - SSL_connect (https://rubygems.org/latest_specs.4.8.gz)
```
If you see error like above in Vagrant, this is probably due to the gem port is blocked. Try some time later, or try a different network (e.g. company vs home.)
