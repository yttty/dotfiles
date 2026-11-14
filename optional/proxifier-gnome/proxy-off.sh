#!/usr/bin/env bash

gsettings set org.gnome.system.proxy mode 'none'

systemctl --user unset-environment \
    http_proxy https_proxy all_proxy no_proxy \
    HTTP_PROXY HTTPS_PROXY ALL_PROXY NO_PROXY
