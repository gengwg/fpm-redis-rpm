# as root
# update system, install requirements
yum update -y
yum groupinstall 'Development Tools' -y
yum install ruby-devel gcc curl libyaml-devel -y
yum install epel-release -y
yum install python-pip -y
yum install vim wget -y

gem install fpm
#sudo -u vagrant gem install fpm
