# Install Git
yum -y install git

# Install rbenv
export RBENV_ROOT="/usr/local/rbenv"
export PATH="${RBENV_ROOT}/bin:${RBENV_ROOT}/shims:${PATH}"
git clone git://github.com/sstephenson/rbenv.git $RBENV_ROOT
# ruby build plugin
RUBY_BUILD_PLUGIN_DIR="${RBENV_ROOT}/plugins/ruby-build"
mkdir -p $RUBY_BUILD_PLUGIN_DIR
git clone git://github.com/sstephenson/ruby-build.git $RUBY_BUILD_PLUGIN_DIR

# gem rehash plugin
GEM_REHASH_PLUGIN_DIR="${RBENV_ROOT}/plugins/rbenv-gem-rehash"
mkdir -p $GEM_REHASH_PLUGIN_DIR
git clone git://github.com/sstephenson/rbenv-gem-rehash.git $GEM_REHASH_PLUGIN_DIR

# set rbenv path (on login)
cat << EOF > /etc/profile.d/rbenv.sh
export RBENV_ROOT="${RBENV_ROOT}"
export PATH="${PATH}"
EOF

# set up rbenv (on login)
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

# default gems config
cat << EOF > ~/.gemrc
---
:sources:
- http://rubygems.org
install: --no-rdoc --no-ri
update: --no-ri --no-rdoc
EOF

# set up rbenv for use right now
eval "$(rbenv init -)"

# install rubies
rbenv install 1.9.3-p362
rbenv shell 1.9.3-p362
rbenv global 1.9.3-p362

# bundler, chef & puppets
gem install bundler --pre
gem install chef
gem install puppet
