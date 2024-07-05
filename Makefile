.POSIX:

all: build

build: listapps-objc listapps-swift listapps-sh

clean:
	rm -f listapps-objc listapps-swift

listapps-objc: listapps.mm
	clang -framework Cocoa -o listapps-objc $<

listapps-swift: listapps.swift
	swiftc -O $< -o listapps-swift

listapps-sh: listapps.sh
	cp $< $@ && chmod +x $@
