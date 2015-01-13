#!/bin/sh
set -e
set -x

mkpasswd -l >/etc/passwd
mkgroup -l >/etc/group
