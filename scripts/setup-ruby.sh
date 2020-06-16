#!/bin/bash

cat >> ~/.bashrc <<EOF
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
EOF

source ~/.bashrc

pushd ~

if [ ! -e ~/.setup/ruby ]; then
    touch ~/.setup/ruby

    apt-install-if-needed ruby ruby-all-dev

    gem install --user-install sass scss_lint

fi

popd