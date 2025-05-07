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
LICENSE=$(QUADRUPLE)/license.m4
QUADRUPLE_BUILDER=$(QUADRUPLE)/QuadrupleBuilder.m4

JAVA_TARGET=$(QUADRUPLE)/java/quadruple-converter/src/main/java/com/google/cloud/datastore/core/quadruple/QuadrupleBuilder.java

CPP_TARGET=$(QUADRUPLE)/cpp/quadruple-converter/quadruple_builder.cc

CPP_HEADER=$(QUADRUPLE)/cpp/quadruple-converter/quadruple_builder.h

PYTHON_TARGET=$(QUADRUPLE)/python/quadruple_builder.py

all: $(JAVA_TARGET) $(PYTHON_TARGET) $(CPP_TARGET) $(CPP_HEADER)

$(JAVA_TARGET): $(LICENSE) java/start.m4 $(QUADRUPLE_BUILDER) java/end.m4
	m4 $^ | sed -e 's/#/\/\//' > "$@"

$(PYTHON_TARGET): $(LICENSE) python/start.m4 $(QUADRUPLE_BUILDER)
	m4 $^ > "$@"

$(CPP_TARGET):  $(LICENSE) cpp/start.m4 $(QUADRUPLE_BUILDER) cpp/end.m4
	m4 $^ | sed -e 's/#/\/\//' -e 's/\$$/#/' > "$@"

$(CPP_HEADER):  $(LICENSE) cpp/header.m4 $(QUADRUPLE_BUILDER) cpp/end.m4
	(cat $(LICENSE); egrep 'def_fn\(|def_array_fn\(|uint64_array\(' $(QUADRUPLE_BUILDER) | m4 cpp/header.m4 - cpp/headerend.m4) | sed -e 's/#/\/\//' -e 's/\$$/#/' > "$@"
