#!/usr/bin/env bash

set -ex

# modify to the version that you want to build
redis_version="3.2.8"
redis_url="http://download.redis.io/releases/redis-${redis_version}.tar.gz"
RELEASE=4

# on dedicated build machine
#base_dir=$(pwd)
#dir_prefix="./"

# on vagrant box
base_dir=/vagrant
dir_prefix="/vagrant"
curr_dir=$(pwd)
install_dir=/opt/redis

# on dedicated build machine
#if [ "$1" = "download" ]; then
 	wget -T 10 -nc "${redis_url}" --directory-prefix=${dir_prefix}
 	tar --directory=${dir_prefix} -zxvf ${dir_prefix}/redis-${redis_version}.tar.gz 
#fi

# build redis binary
cd ${dir_prefix}/redis-${redis_version}/
make clean
make 

#fpmbin=/usr/local/rvm/gems/ruby-2.3.0/bin/fpm
fpmbin=/usr/local/bin/fpm
if [ ! -x "${fpmbin}" ]; then
  sudo gem install fpm
fi

# build redis rpm
${fpmbin} -s dir \
-t rpm \
--maintainer "https://github.com/gengwg" \
--license "Apache 2.0" \
-n redis -v ${redis_version} \
--iteration $RELEASE \
--vendor "Redis" \
--url "http://redis.io/" \
--rpm-user redis \
--rpm-group redis \
--directories /opt/redis \
--depends supervisor \
--config-files $install_dir/etc/redis7379.conf \
--config-files /etc/supervisord.d/redis7379.ini \
--config-files $install_dir/etc/redis7479.conf \
--config-files /etc/supervisord.d/redis7479.ini \
--config-files $install_dir/etc/redis7579.conf \
--config-files /etc/supervisord.d/redis7579.ini \
--config-files $install_dir/etc/redis7679.conf \
--config-files /etc/supervisord.d/redis7679.ini \
--config-files $install_dir/etc/redis7779.conf \
--config-files /etc/supervisord.d/redis7779.ini \
--config-files $install_dir/etc/redis7879.conf \
--config-files /etc/supervisord.d/redis7879.ini \
--before-install ${base_dir}/files/before_install.sh \
--after-install ${base_dir}/files/after_install.sh \
--after-remove ${base_dir}/files/after_remove.sh \
--description "Redis is an open source, BSD licensed, advanced key-value cache and store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets, sorted sets, bitmaps and hyperloglogs." \
-a "x86_64" \
./src/redis-server=$install_dir/bin/ \
./src/redis-cli=$install_dir/bin/ \
./src/redis-benchmark=$install_dir/bin/ \
./src/redis-check-aof=$install_dir/bin/ \
./src/redis-check-rdb=$install_dir/bin/ \
./src/redis-sentinel=$install_dir/bin/ \
./src/redis-trib.rb=$install_dir/bin/ \
${base_dir}/files/redis7379.conf=$install_dir/etc/ \
${base_dir}/files/redis7379.ini=/etc/supervisord.d/ \
${base_dir}/files/redis7479.conf=$install_dir/etc/ \
${base_dir}/files/redis7479.ini=/etc/supervisord.d/ \
${base_dir}/files/redis7579.conf=$install_dir/etc/ \
${base_dir}/files/redis7579.ini=/etc/supervisord.d/ \
${base_dir}/files/redis7679.conf=$install_dir/etc/ \
${base_dir}/files/redis7679.ini=/etc/supervisord.d/ \
${base_dir}/files/redis7779.conf=$install_dir/etc/ \
${base_dir}/files/redis7779.ini=/etc/supervisord.d/ \
${base_dir}/files/redis7879.conf=$install_dir/etc/ \
${base_dir}/files/redis7879.ini=/etc/supervisord.d/ \

mv -vf  ./redis-${version}*.rpm ${base_dir}/
cd -
