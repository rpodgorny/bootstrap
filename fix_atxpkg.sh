#!/bin/sh

if icacls c:\\atxpkg | grep CREATOR; then
  mv c:\\atxpkg c:\\atxpkg2;
  mkdir c:\\atxpkg;
  cp -rv /cygdrive/c/atxpkg2/* c:\\atxpkg;
  rm -rf c:\\atxpkg2;
fi
