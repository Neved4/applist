![Swift Badge](https://img.shields.io/badge/Swift-F05138?logo=swift&logoColor=fff&style=for-the-badge)
![Shell Script](https://img.shields.io/badge/Shell_Script-9DDE66?logo=gnubash&logoColor=000&style=for-the-badge)

# `appdir` - List app directories under macOS!

These are implementations to list app locations in a system. The ones in
[Swift] (`68.2 ms`) and [Objective-C] (`78.4 ms`) are trying to mimic
`mdfind`'s (`29.1 ms`) behavior.

## Getting Started

> [!NOTE]
> _**This utility is only intended to run in [macOS].**_

If you have [`brew`] installed, just run:
```sh
$ brew install Neved4/tap/appdir
```

Otherwise, first clone the repo:
```sh
$ git clone https://github.com/Neved4/appdir
```

For the Objective-C version, go to the project directory and run:
```sh
$ clang -framework Cocoa -o appdir-objc appdir.mm
```

For the Swift version, run:
```sh
$ swiftc -O appdir.swift -o appdir-swift
```

Done!

Alternatively, if you'd rather not install or compile feel free to add it as a
function to your shell `.profile`:
```sh
appdir() {
    mdfind "kMDItemContentType == 'com.apple.application-bundle'"
}
```

## Usage

```sh
$ ./appdir-swift | grep "Docker.app"
/Applications/Docker.app
```

This comes handy for manual [Homebrew][`brew`] reinstalls that lie outside the
default install path:
```sh
$ brew reinstall --cask docker --appdir $(appdir | grep Docker)
```

## Benchmarks

All programs were benchmarked with [`hyperfine`] under [`arm64`]:

| Command          |  Mean [ms] | Min [ms] | Max [ms] |    Relative |
| :--------------- | ---------: | -------: | -------: | ----------: |
| `appdir-sh`    | 29.1 ± 1.7 |     27.2 |     33.7 |        1.00 |
| `appdir-objc`  | 68.2 ± 3.5 |     63.7 |     81.5 | 2.34 ± 0.18 |
| `appdir-swift` | 78.4 ± 4.2 |     71.0 |     89.9 | 2.69 ± 0.21 |

## License

`appdir` is licensed under the terms of the [MIT License].
   
See the [LICENSE](LICENSE) file for details.

[`arm64`]: https://en.wikipedia.org/wiki/AArch64
[`brew`]: https://brew.sh/
[`hyperfine`]: https://github.com/sharkdp/hyperfine
[macOS]: https://www.apple.com/macos/
[MIT License]: https://opensource.org/license/mit/
[Objective-C]: https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html
[Swift]: https://www.swift.org/
