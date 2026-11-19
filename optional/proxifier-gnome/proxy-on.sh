#!/usr/bin/env bash

proxy_host='127.0.0.1'
proxy_port=7890
bypass_hosts=(
  'localhost'
  '127.0.0.0/8'
  '192.168.0.0/16'
  '10.0.0.0/8'
  '172.16.0.0/12'
  '::1'
)

http_proxy_url="http://${proxy_host}:${proxy_port}"
socks_proxy_url="socks5h://${proxy_host}:${proxy_port}"

# Render the same bypass list for environment variables and GSettings.
printf -v no_proxy_list '%s,' "${bypass_hosts[@]}"
no_proxy_list="${no_proxy_list%,}"
printf -v ignore_hosts "'%s', " "${bypass_hosts[@]}"
ignore_hosts="[${ignore_hosts%, }]"

gsettings set org.gnome.system.proxy.http host "$proxy_host"
gsettings set org.gnome.system.proxy.http port "$proxy_port"

gsettings set org.gnome.system.proxy.https host "$proxy_host"
gsettings set org.gnome.system.proxy.https port "$proxy_port"

gsettings set org.gnome.system.proxy.socks host "$proxy_host"
gsettings set org.gnome.system.proxy.socks port "$proxy_port"

gsettings set org.gnome.system.proxy ignore-hosts "$ignore_hosts"

gsettings set org.gnome.system.proxy mode 'manual'

systemctl --user set-environment \
  "http_proxy=$http_proxy_url" \
  "https_proxy=$http_proxy_url" \
  "all_proxy=$socks_proxy_url" \
  "HTTP_PROXY=$http_proxy_url" \
  "HTTPS_PROXY=$http_proxy_url" \
  "ALL_PROXY=$socks_proxy_url" \
  "no_proxy=$no_proxy_list" \
  "NO_PROXY=$no_proxy_list"
