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

define(quadruple_test, `  check($1, $2, $3n, $4n, $5);')dnl
define(test_case, `  it("$1", function() {')dnl
define(test_case_end, `  });
')dnl

import 'jasmine';
import { QuadrupleBuilder } from '../quadruple_builder';

function check(mantissa: string, exp10: number, mantHi: bigint, mantLo: bigint, exponent: number) : void {
  let l = mantissa.length;
  let digits: number[] = new Array(l);
  for (let i = 0; i < l; i++) {
    digits[i] = mantissa.charCodeAt(i) - 48;
  }

  let quadruple = QuadrupleBuilder.parseDecimal(digits, exp10);
  expect(quadruple.mantHi).toBe(mantHi);
  expect(quadruple.mantLo).toBe(mantLo);
  expect(quadruple.exponent).toBe(exponent);
}

describe("QuadrupleBuilderTest", function() {
