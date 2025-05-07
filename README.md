# QuadrupleConverter

This repository contains a multi-language library to convert decimal floating point
numbers to the 128-bit mantissa floating point format of https://github.com/m-vokhm/Quadruple

The Quadruples that result from this conversion can be used, e.g., as a super-type of [decima128](https://en.wikipedia.org/wiki/Decimal128_floating-point_format) and IEEE 64-bit binary for the purposes of comparing numbers.

This library is derived from the string to binary floating point conversion in https://github.com/m-vokhm/Quadruple

## Repository Organization

The `src` directory contains the rules to generate the library in each language,
and the `test` directory contains the tests and rules to generate the test in
each language. See the README.md files in those directories for more details on
how the source code for each language is generated.

`third_party/Quadruple/QuadrupleBuilder.m4` is the actual multi-language source
code, and the per-language libraries are in per-language sub-directories of
`third_party/Quadruple` (currently, `java`, `python` and `cpp`). The code in these
directories can be re-generated following the instructions in `src/README.md`
and `test/README.md`.
