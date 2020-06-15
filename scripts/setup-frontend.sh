#!/bin/bash

FRONTEND_VERSION="t4dev"

pushd ~

cat > /tmp/conf.json <<EOF
{
    "api": "/api/v1/",
    "eventsUrl": null,
    "debug": "true",
    "publicRegisterEnabled": true,
    "feedbackEnabled": false,
    "privacyPolicyUrl": null,
    "termsOfServiceUrl": null,
    "maxUploadFileSize": null,
    "gitHubClientId": null,
    "contribPlugins": []
}
EOF


if [ ! -e ~/taiga-front ]; then
    # Initial clear
    git clone https://github.com/pkohut/taiga-front.git taiga-front
    pushd ~/taiga-front
    git checkout -f t4dev

    mkdir -p dist
    mv /tmp/conf.json dist/

    popd
else
    pushd ~/taiga-front
    git fetch
    git checkout -f t4dev 
    git reset --hard origin/t4dev
    popd
fi

popd
