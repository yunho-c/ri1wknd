cxx := "clang++"
std := "-std=c++17"
warnings := "-Wall -Wextra -pedantic"
target := "raytracer"
release_target := "raytracer-release"

build:
	{{cxx}} {{std}} {{warnings}} -g -O0 main.cc -o {{target}}

release:
	{{cxx}} {{std}} {{warnings}} -O3 -DNDEBUG main.cc -o {{release_target}}

run: build
	./{{target}} > image.ppm

runr: release
	./{{release_target}} > image.ppm

clean:
	rm -f {{target}} {{release_target}} image.ppm
