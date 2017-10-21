#!/usr/bin/env bash

set -e

bundle install
RACK_ENV=production ruby app.rb
