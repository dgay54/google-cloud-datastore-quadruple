#  Copyright 2025 Google LLC
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

define(quadruple_test, `check(test_name, $1, translit($2, _), translit($3, _)LL, translit($4, _)LL, translit($5, _)LL);')
define(test_case, `  test_name = "$1";')
define(test_case_end, `
')

$include "quadruple_builder.h"
$include <iostream>
$include <string>

int exit_code = 0;

void expect_equals(const std::string& test_name,
                  uint64_t actual, uint64_t expected) {
  if (actual != expected) {
    std::cout << test_name << actual << " != (expected) " << expected << "\n";
    exit_code = 2;
  }
}

void check(const std::string& test_name, const std::string& digits,
           int64_t exp10, uint64_t mant_hi, uint64_t mant_lo, uint64_t exponent) {
  std::vector<uint8_t> vdigits(digits.size());
  for (int i = 0; i < digits.size(); i++) {
    vdigits[i] = digits[i] - '0';
  }

  cloud_datastore::util::QuadrupleBuilder parser;
  parser.parseDecimal(vdigits, exp10);

  std::string name = test_name + ":" + digits + "e" + std::to_string(exp10);
  expect_equals(name + " (hi)", parser.mantHi, mant_hi);
  expect_equals(name + " (lo)", parser.mantLo, mant_lo);
  expect_equals(name + " (exp)", parser.exponent, exponent);
}

int main(int argc, char **argv) {
  std::string test_name;

