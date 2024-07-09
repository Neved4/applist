.POSIX:

all: build

build: applist-objc applist-swift applist-sh

clean:
	rm -f applist-objc applist-swift

applist-objc: applist.mm
	clang -framework Cocoa -o applist-objc $<

applist-swift: applist.swift
	swiftc -O $< -o applist-swift

applist-sh: applist.sh
	cp $< $@ && chmod +x $@
