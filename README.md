# Chain shared or static libraries together

A driver program links to SharedOrStaticLib1, which in turn links to SharedOrStaticLib2,
which in turn links to SharedOrStaticLib3. The CMake linking is `PRIVATE` so SharedOrStaticLib1 only has information about SharedOrStaticLib2 but not about SharedOrStaticLib3; likewise the main driver program only has information about SharedOrStaticLib1, but not about SharedOrStaticLib2 nor SharedOrStaticLib3.

If at the CMake generation step the flag `BUILD_SHARED_LIBS` is set to `ON`, all three libraries will be build as shared libraries; otherwise if it is `OFF` or omitted, then all
three libraries will be build as static.

```
cmake --preset NinjaMC-Gnu -D BUILD_SHARED_LIBS=<ON|OFF>
cmake --build --preset NinjaMC-Gnu --config <Debug|Release|RelWithDebInfo>
cmake --build --preset NinjaMC-Gnu --config <Debug|Release|RelWithDebInfo> --target run
```

```
cmake --preset NinjaMC-Clang -D BUILD_SHARED_LIBS=<ON|OFF>
cmake --build --preset NinjaMC-Clang --config <Debug|Release|RelWithDebInfo>
cmake --build --preset NinjaMC-Clang --config <Debug|Release|RelWithDebInfo> --target run
```

```
cmake --preset NinjaMC-Msvc -D BUILD_SHARED_LIBS=<ON|OFF>
cmake --build --preset NinjaMC-Msvc --config <Debug|Release|RelWithDebInfo>
cmake --build --preset NinjaMC-Msvc --config <Debug|Release|RelWithDebInfo> --target run
```

**N.B.**

- On Windows 11 it is preferable to issue the commands from **"Developer Command Prompt for VS 2022"** instead of regular PowerShell or CMD because the former has predefined Visual Studio environment variables which enable compilation with VS compiler.
- If nevertheless using PowerShell/CMD, or on Windows 10, one must first run some appropriate *.bat scripts that define VS environment variables.

Run `cmake --list-presets all` to see which other presets are available (out of those defined in CMakePresets.json) on a given platform.

```
cmake --preset NMake-Msvc-Debug -D BUILD_SHARED_LIBS=OFF
cmake --build --preset NMake-Msvc-Debug --target help
cmake --build --preset NMake-Msvc-Debug --target docs-doxygenNotSphinx
cmake --build --preset NMake-Msvc-Debug --target docs-sphinxNotDoxygen

cmake --build --preset NMake-Msvc-Debug --target docs-doxygen
cmake --build --preset NMake-Msvc-Debug --target docs-doxygen-open

cmake --build --preset NMake-Msvc-Debug --target docs-latex
cmake --build --preset NMake-Msvc-Debug --target docs-latex-open

cmake --build --preset NMake-Msvc-Debug --target docs-sphinx
cmake --build --preset NMake-Msvc-Debug --target docs-sphinx-open
```

https://thatonegamedev.com/cpp/ci-cd-for-c-c-games-using-github-actions/

https://levelup.gitconnected.com/utilizing-github-actions-to-build-and-test-on-multiple-platforms-a7fe3aa6ce2a

