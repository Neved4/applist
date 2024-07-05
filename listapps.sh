#!/bin/sh
set -Cefu

listapps() {
	mdfind "kMDItemContentType == 'com.apple.application-bundle'"
}

listapps
