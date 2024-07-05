#!/bin/sh
set -Cefu

appdir() {
	mdfind "kMDItemContentType == 'com.apple.application-bundle'"
}

appdir
