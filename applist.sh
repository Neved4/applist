#!/bin/sh
set -Cefu

applist() {
	mdfind "kMDItemContentType == 'com.apple.application-bundle'"
}

applist
