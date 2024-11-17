![macOS](https://img.shields.io/badge/macOS-000000?style=flat&logo=apple&logoColor=fff)
![Swift Badge](https://img.shields.io/badge/Swift-F05138?logo=swift&logoColor=fff&style=flat)
![Shell Script](https://img.shields.io/badge/Shell_Script-9DDE66?logo=gnubash&logoColor=000&style=flat)

## `applist` - List app directories in macOS! 🚀

These utilities list app locations in [macOS]

The [Swift] (`68.2 ms`) and [Objective-C] (`78.4 ms`) implementations try to mimic
`mdfind`'s (`29.1 ms`) behavior, but run slower than it.

## Getting Started

> [!NOTE]
> _**This utility is only intended to run in [macOS].**_

### Prerequisites

When you are building [`applist`], ensure you have either:
- A [Swift] compiler
- An [Objective-C] compiler.

### Installing

If you have [`brew`] installed, just run:
```sh
$ brew install Neved4/tap/applist
```

Otherwise, first clone the repo:
```sh
$ git clone https://github.com/Neved4/applist
```

To build all variants, go to the project directory and run:
```sh
$ make all
```

Alternatively, to build the [Objective-C] version run:
```sh
$ clang -framework Cocoa -o applist-objc applist.mm
```

For the [Swift] version, run:
```sh
$ swiftc -O applist.swift -o applist-swift
```

Done!

Alternatively, if you'd rather not install or compile anything, feel free to
add it as a function to your shell `.profile`:
```sh
applist() {
    mdfind "kMDItemContentType == 'com.apple.application-bundle'"
}
```

## Usage

```sh
$ applist | grep "Docker.app"
/Applications/Docker.app
```

This comes handy for manual [Homebrew][`brew`] reinstalls that lie outside
the default install path:
```sh
$ brew reinstall --cask docker --applist $(applist | grep Docker)
```

## Benchmarks

All programs were benchmarked with [`hyperfine`] under [`arm64`]:

| Command         |  Mean [ms] | Min [ms] | Max [ms] |    Relative |
| :-------------- | ---------: | -------: | -------: | ----------: |
| `applist-sh`    | 29.1 ± 1.7 |     27.2 |     33.7 |        1.00 |
| `applist-objc`  | 68.2 ± 3.5 |     63.7 |     81.5 | 2.34 ± 0.18 |
| `applist-swift` | 78.4 ± 4.2 |     71.0 |     89.9 | 2.69 ± 0.21 |

## See Also

For other shell functions like `applist`, check out [apputils].

## License

[`applist`] is licensed under the terms of the [MIT License].

See the [LICENSE](LICENSE) file for details.

[`applist`]: https://github.com/Neved4/applist
[`arm64`]: https://en.wikipedia.org/wiki/AArch64
[`brew`]: https://brew.sh/
[`hyperfine`]: https://github.com/sharkdp/hyperfine
[macOS]: https://www.apple.com/macos/
[MIT License]: https://opensource.org/license/mit/
[apputils]: https://github.com/Neved4/apputils
[Objective-C]:
    https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html
[Swift]: https://www.swift.org/
