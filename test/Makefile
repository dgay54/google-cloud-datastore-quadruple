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

QUADRUPLE=../third_party/Quadruple

JAVA_TEST=$(QUADRUPLE)/java/quadruple-converter/src/test/java/com/google/cloud/datastore/core/quadruple/QuadrupleBuilderTest.java

PYTHON_TEST=$(QUADRUPLE)/python/quadruple_builder_test.py

TYPESCRIPT_TEST=$(QUADRUPLE)/typescript/spec/quadruple_builder_spec.ts

CPP_TEST=$(QUADRUPLE)/cpp/quadruple-converter/quadruple_builder_test.cc

all: $(JAVA_TEST) $(PYTHON_TEST) $(TYPESCRIPT_TEST) $(CPP_TEST)

$(JAVA_TEST): java/start.m4 edgecases.m4 testcases.m4 java/end.m4
	m4 $^ | sed -e 's/#/\/\//' > "$@"

$(PYTHON_TEST): python/start.m4 edgecases.m4 testcases.m4 python/end.m4
	m4 $^ > "$@"

$(TYPESCRIPT_TEST): typescript/start.m4 edgecases.m4 testcases.m4 typescript/end.m4
	m4 $^ | sed -e 's/#/\/\//' > "$@"

$(CPP_TEST): cpp/start.m4 edgecases.m4 testcases.m4 cpp/end.m4
	m4 $^ | sed -e 's/#/\/\//' -e 's/\$$/#/' > "$@"
