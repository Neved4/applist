![Swift Badge](https://img.shields.io/badge/Swift-F05138?logo=swift&logoColor=fff&style=for-the-badge)
![Shell Script](https://img.shields.io/badge/Shell_Script-9DDE66?logo=gnubash&logoColor=000&style=for-the-badge)

# `listapps` - List apps under macOS!

These are three implementations, with [Swift] (`68.2 ms`) and [Objective-C]
(`78.4 ms`), trying to mimic `mdfind`'s (`29.1 ms`) behavior to list app
locations.

## Getting Started

> [!NOTE]
> _**This utility is only intended to run in [macOS].**_

If you have [`brew`] installed, just run:
```sh
$ brew install Neved4/tap/listapps
```

Otherwise, first clone the repo:
```sh
$ git clone https://github.com/Neved4/listapps
```

For the Objective-C version, go to the project directory and run:
```sh
$ clang -framework Cocoa -o listapps-objc listapps.mm
```

For the Swift version, go to the project directory and run:
```sh
$ swiftc -O listapps.swift -o listapps-swift
```

Done!

## Usage

```sh
$ ./listapp-swift | grep "Docker.app"
/Applications/Docker.app
```

## Benchmarks

All programs were benchmarked with [`hyperfine`]:

| Command          |  Mean [ms] | Min [ms] | Max [ms] |    Relative |
| :--------------- | ---------: | -------: | -------: | ----------: |
| `listapps-sh`    | 29.1 ± 1.7 |     27.2 |     33.7 |        1.00 |
| `listapps-objc`  | 68.2 ± 3.5 |     63.7 |     81.5 | 2.34 ± 0.18 |
| `listapps-swift` | 78.4 ± 4.2 |     71.0 |     89.9 | 2.69 ± 0.21 |

## License

`listapps` is licensed under the terms of the [MIT License].
   
See the [LICENSE](LICENSE) file for details.

[`brew`]: https://brew.sh/
[`hyperfine`]: https://github.com/sharkdp/hyperfine
[macOS]: https://www.apple.com/macos/
[MIT License]: https://opensource.org/license/mit/
[Objective-C]: https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html
[Swift]: https://www.swift.org/
