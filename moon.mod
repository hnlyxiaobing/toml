name = "hnlyxiaobing/toml"

version = "0.4.7"

import {
  "bobzhang/lexer@0.2.0",
  "moonbitlang/quickcheck@0.14.0",
  "moonbitlang/x@0.5.1",
}

readme = "README.mbt.md"

repository = "https://github.com/hnlyxiaobing/toml"

license = "Apache-2.0"

keywords = [ "toml", "parser", "config" ]

description = "A TOML parser implementation in MoonBit (fork of bobzhang/toml with array-of-tables fix)"

options(
  warnings: "+a-unused_optional_argument-unused_default_value-missing_invariant-missing_reasoning",
)