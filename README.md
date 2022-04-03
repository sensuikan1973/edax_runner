# edax_runner
<p align="center">
<img src="https://github.com/sensuikan1973/edax_runner/blob/main/resources/logo.png?raw=true" alt="edax-runner" />
</p>

**tiny tool for [edax-reversi](https://github.com/abulmo/edax-reversi) auto learning**.

- **you can write learning list as simple format txt**.
  - you can also check the logs with `learned_log.txt`.
- support **Mac, Windows, Linux**.

![demo](https://github.com/sensuikan1973/edax_runner/blob/main/resources/demo.gif)

## Usage
1. download the Asset from the [latest Release](https://github.com/sensuikan1973/edax_runner/releases/latest).
2. edit `learning_list.txt` which you want to let edax learn.
3. run edax_runner on your terminal.

<details><summary>Mac</summary>

```sh
## First, confirm you can launch edax
./bin/mEdax
## Next, start learning!
./edax_runner-mac
```
</details>

<details><summary>Windows</summary>

```sh
## First, confirm you can launch edax
start ./bin/wEdax-x64.exe
## Next, start learning!
start ./edax_runner-windows.exe
```
</details>

<details><summary>Linux</summary>

```sh
## First, confirm you can launch edax
./bin/lEdax-x64-modern
## Next, start learning!
./edax_runner-linux
```
</details>

### important option
- edit `edax.ini` depending on your machine.
- add your `book.dat` to `data/book.dat`.

### how to write learning_list.txt ?
There are **only 3 rules**. Example is [here](https://github.com/sensuikan1973/edax_runner/blob/main/resources/learning_list.txt).

| purpose | format | example |
| :--- | :--- | :--- |
| learn one game of edax vs edax | `{book-randomness},{move}` | `2,F5F6F7F8` |
| book deviate | `[arg1 arg2] {move}` | `[1 1] F5F6F7F8` |
| comment | `// {your comment}` | `// I like Brightwell` |

- NOTE
  - The default value of `book-randomness` is `0`
  - What's `book deviate` ?: See [document](https://sensuikan1973.github.io/edax-reversi/book_8c.html#ae9ee489a468274fd83808c53da0418c9)
  - Although `book fix` is ran internally, you can run `book fix` expressly.  
    If you want, write `fix` in `learning_list.txt`.

## Reference
- **[edax-reversi](https://github.com/abulmo/edax-reversi)**
  - [code/releases archive](https://code.google.com/archive/p/edax-reversi/downloads)
  - [website archive](https://archive.is/KshiN)
  - [document](https://sensuikan1973.github.io/edax-reversi/)
- [Edax_AutoLearning_Tool](https://github.com/sensuikan1973/Edax_AutoLearning_Tool): original tool. See **[issues/1](https://github.com/sensuikan1973/Edax_AutoLearning_Tool/issues/1)**.
- [Choirokoitia | Edax](https://choi.lavox.net/edax/start): great edax documents (Japanese)

## Development
![Dart CI](https://github.com/sensuikan1973/edax_runner/workflows/Dart%20CI/badge.svg)
[![codecov](https://codecov.io/gh/sensuikan1973/edax_runner/branch/main/graph/badge.svg?token=7ZF8NAY1NS)](https://codecov.io/gh/sensuikan1973/edax_runner)
![publish_artifacts_gcc](https://github.com/sensuikan1973/edax_runner/workflows/publish_artifacts_gcc/badge.svg)
![publish_artifacts_icc](https://github.com/sensuikan1973/edax_runner/workflows/publish_artifacts_icc/badge.svg)

### format
```sh
dart format . -l 120
```

### document
```sh
dartdoc --include-external bin/**
```

### local build
```sh
# e.g. Mac
export dst='build'
export bin_name="edax_runner-mac"
export edax_build_command="make build ARCH=x64-modern COMP=gcc OS=osx"
export edax_bin_name="mEdax"

./scripts/build_edax.sh
dart compile exe bin/edax_runner.dart -v -o $dst/$bin_name

cd $dst
./$bin_name
```
