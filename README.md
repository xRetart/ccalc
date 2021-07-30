# ccalc
The `ccalc` commandline binary parses and evaluates mathematical expressions in
[postfix notation](https://en.wikipedia.org/wiki/Reverse_Polish_notation).
It aims to provide a simple and small utility suited for being embedded in scripts.
`ccalc` is open-source and written in Haskell which makes it platform independent and secure.

## Dependencies
* The Haskell build system: `cabal`. (package `cabal-install` on most Linux distributions)

## Installation (Linux)
1. Build binary from source.
 	```shell
 	cabal build --enable-optimization=2
 	```

1. Install the built binary as root, where *platform* -for example- may be `x86_64-linux` and *GCH name* `ghc-8.10.5`.
 	<pre>
 	install --owner=root --group=root --strip dist-newstyle/build/<i>platform</i>/<i>GHC name</i>/ccalc-0.1.0.0/x/ccalc/build/ccalc/ccalc /usr/bin
 	</pre>
