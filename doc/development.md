# Development

## format

```sh
dart format . -l 120
```

## compile

```sh
# mac
./scripts/build_edax_runner.sh edax_runner libedax.universal.dylib

# linux
./scripts/build_edax_runner.sh edax_runner libedax.so

# windows
./scripts/build_edax_runner.sh edax_runner.exe libedax-x64.dll
```

## fetch libedax assets as pedax assets

```sh
./scripts/fetch_libedax_assets.sh
```
