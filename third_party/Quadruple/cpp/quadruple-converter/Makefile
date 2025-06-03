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

all: quadruple_builder.o quadruple.o

clean:
	rm -f *.o quadruple_builder_test quadruple_test

test: quadruple_builder_test quadruple_test
	./quadruple_builder_test
	./quadruple_test

quadruple.o: quadruple.h quadruple_builder.h quadruple.cc
	g++ -Wall -o "$@" -c -std=c++14 quadruple.cc

quadruple_builder.o: quadruple_builder.h quadruple_builder.cc
	g++ -Wall -Wmissing-braces -o "$@" -c -std=c++14 quadruple_builder.cc

quadruple_builder_test: quadruple_builder.o quadruple_builder_test.cc
	g++ -o "$@" quadruple_builder_test.cc quadruple_builder.o -lgtest

quadruple_test: quadruple_test.cc quadruple.o
	g++ -o "$@" quadruple_test.cc quadruple.o quadruple_builder.o -lgtest
