.POSIX:

all: build

build: appdir-objc appdir-swift appdir-sh

clean:
	rm -f appdir-objc appdir-swift

appdir-objc: appdir.mm
	clang -framework Cocoa -o appdir-objc $<

appdir-swift: appdir.swift
	swiftc -O $< -o appdir-swift

appdir-sh: appdir.sh
	cp $< $@ && chmod +x $@
