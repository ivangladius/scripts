#!/usr/bin/bash


#set -xe

KEY="<Super>$1"
(for schema in $(gsettings list-schemas); do gsettings list-recursively $schema; done) | grep "$KEY"
