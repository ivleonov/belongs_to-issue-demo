#!/bin/bash
set -e

rake db:setup
rm -f /myapp/tmp/pids/server.pid
exec "$@"
