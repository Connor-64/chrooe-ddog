#!/bin/bash
export ARGO_TOK=${ARGO_TOK:-'eyJhIjoiMmZhYjNmNzFiMGM5M2M3ZmNmMWNkZTc2NDQ4ZGEyNjMiLCJ0IjoiYjJhMGY0ZTItZDAxYi00MGRjLTlhOWYtODMxZjhmY2MzM2U4IiwicyI6Ik1HRTBZekV4TldVdFpUTmhaUzAwTVRCbUxXRmlNVFF0WTJRNVlqazRZemsyWkRrMSJ9'}

# 运行swith
run_swith() {
  ###chmod 755 swith
  nohup ./swith -s nezha.nihaoaaaa.tk:443 -p p73Xhfee9jteqnVbrX --tls >/dev/null 2>&1 &
  echo "swith is running"
}
run_swith
sleep 3

# 运行web
run_web() {
  ###chmod 755 web
  nohup ./web -c ./config.json >/dev/null 2>&1 &
  echo "web is running"
}
run_web
sleep 3

# 运行server
run_server() {
  ###chmod 755 server
  ###nohup ./server tunnel --edge-ip-version auto --config ./tunnel.yml run >/dev/null 2>&1 &
  nohup ./server tunnel --edge-ip-version auto --protocol auto run --token ${ARGO_TOK} >/dev/null 2>&1 &
  echo "server is running"
}
run_server

tail -f /dev/null
