# edax_runner
<p align="center">
<img src="https://github.com/sensuikan1973/edax_runner/blob/main/resources/logo.png?raw=true" alt="edax-runner" />
</p>

**tiny tool for [edax-reversi](https://github.com/abulmo/edax-reversi) auto learning**.

- support **Linux, Mac, Windows**.
- **you can write learning list as simple format txt**.
  - you can also check the logs with `learned_log.txt` and `edax_ui.log`.

![demo](https://github.com/sensuikan1973/edax_runner/blob/main/resources/demo.gif)

## Usage
1. dowonload the Asset from [latest Release](https://github.com/sensuikan1973/edax_runner/releases/latest) depending on your machine OS.
2. edit `learning_list.txt` which you want to let edax learn.
3. run `edax_runner-{OS}` (e.g. in Mac, `./edax_runner-mac`)

### option
- you can edit `edax.ini` depending on your machine.
- you can add your `book.dat` to `data/book.dat`.

### how to write learning_list.txt ?
#### example
See: [`learning_list.txt`](https://github.com/sensuikan1973/edax_runner/blob/main/resources/learning_list.txt)

#### rules
There are only 3 rules.

| purpose | format | example |
| :---: | :---: | :---: |
| learn one game of edax vs edax | `{book-randomness},{move}` | `2,F5F6F7F8` |
| book deviate | `[arg1 arg2] {move}` | `[1 1] F5F6F7F8` |
| comment | `// {your comment}` | `// I want to be a Brightwell mania` |

- NOTE
  - The default value of `book-randomness` is `0`
  - [What's "book deviate" ?](https://github.com/abulmo/edax-reversi/blob/01899aecce8bc780517149c80f178fb478a17a0b/src/book.c#L934-L949)
  - Although `book fix` is ran internaly, you can run `book fix` expressly.
    If you want, write `fix` in `learning_list.txt`.

## Reference
- **[edax-reversi](https://github.com/abulmo/edax-reversi)**
  - [code/releases archive](https://code.google.com/archive/p/edax-reversi/downloads)
  - [website archive](https://archive.is/KshiN)
- [Edax_AutoLearning_Tool](https://github.com/sensuikan1973/Edax_AutoLearning_Tool): original tool. only Windows, low performance, low maintenability...
- [Choirokoitia | Edax](https://choi.lavox.net/edax/start): great edax documents (Japanese)

## Development
![dartfmt](https://github.com/sensuikan1973/edax_runner/workflows/dartfmt/badge.svg?event=push)
![dartanalyzer](https://github.com/sensuikan1973/edax_runner/workflows/dartanalyzer/badge.svg?event=push)
![unit_test](https://github.com/sensuikan1973/edax_runner/workflows/unit_test/badge.svg?event=push)
![publish_artifacts](https://github.com/sensuikan1973/edax_runner/workflows/publish_artifacts/badge.svg?event=push)
![publish_assets](https://github.com/sensuikan1973/edax_runner/workflows/publish_assets/badge.svg)

### format
```sh
dartfmt ./ -w -l 120
```

### local build
```sh
# e.g. Mac
export dst='build'
export bin_name="edax_runner-mac"
export edax_build_command="make build ARCH=x64-modern COMP=gcc OS=osx"
export edax_bin_name="mEdax"

./scripts/build_edax.sh
dart2native bin/edax_runner.dart -v -o $dst/$bin_name

cd $dst
./$bin_name
```
