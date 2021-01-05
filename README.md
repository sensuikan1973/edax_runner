# edax_runner
<p align="center">
<img src="https://github.com/sensuikan1973/edax_runner/blob/main/resources/logo.png?raw=true" alt="edax-runner" />
</p>

**simple cli tool for [edax-reversi](https://github.com/abulmo/edax-reversi) auto learning**.

- support Linux, Mac, Windows.
- you only write _learning_list_ txt.

## Usage
1. dowonload edax-runner Release (TODO: add link)
2. edit `learning_list.txt` which you want to let edax learn
3. (option) edit `edax.ini`
4. (option) replace `data/book.dat` with your `book.dat`
5. `./edax_runner`

### How to write learning_list.txt
#### example
See: [`learning_list.txt`](https://github.com/sensuikan1973/edax_runner/blob/main/learning_list.txt)

#### rules
There are only 4 syntaxes.

- `book deviate`: `[1st_arg 2nd_arg] move`
- learn one game by randomness mode 2: `randomness, move`
  - default randomenss is `0`
- `book fix`: `fix`
- comment: `// comment`

## Reference
- **[edax-reversi](https://github.com/abulmo/edax-reversi)**
  - [code/releases archive](https://code.google.com/archive/p/edax-reversi/downloads)
  - [website archive](https://archive.is/KshiN)
- [Edax_AutoLearning_Tool](https://github.com/sensuikan1973/Edax_AutoLearning_Tool): My original tool. This has many issues such as low performance, low maintainability, only Windows etc. edax_runner replace/enhance the tool.
- [Choirokoitia | Edax](https://choi.lavox.net/edax/start)

## Development
![dartfmt](https://github.com/sensuikan1973/edax_runner/workflows/dartfmt/badge.svg?event=push)
![dartanalyzer](https://github.com/sensuikan1973/edax_runner/workflows/dartanalyzer/badge.svg?event=push)
![unit_test](https://github.com/sensuikan1973/edax_runner/workflows/unit_test/badge.svg?event=push)
![publish_artifacts](https://github.com/sensuikan1973/edax_runner/workflows/publish_artifacts/badge.svg?event=push)

### format
```sh
dartfmt ./ -w -l 120
```

### local build (Mac)
```sh
./scripts/build_on_mac.sh # TODO: Docker
cd build
./edax_runner-mac
```
