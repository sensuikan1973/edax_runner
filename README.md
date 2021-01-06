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
There are only 5 rules.

| rule | how to write | example | note |
| :---: | :---: | :---: | :---: |
| learn one game by edax vs edax game | `{book-randomness},{move}` | `2,F5F6F7F8` | the default value of `book-randomness` is `0` |
| run `book deviate arg1 arg2` | `[arg1 arg2] {move}` | `[1 1] F5F6F7F8` | [what's "book deviate" ?](https://github.com/abulmo/edax-reversi/blob/01899aecce8bc780517149c80f178fb478a17a0b/src/book.c#L934-L949) |
| run `book fix` | `fix` | `fix` | |
| run `quit` | `quit` | `quit` | |
| comment | `// foo bar` | `// my favorite Brightwell variations` | |

## Reference
- **[edax-reversi](https://github.com/abulmo/edax-reversi)**
  - [code/releases archive](https://code.google.com/archive/p/edax-reversi/downloads)
  - [website archive](https://archive.is/KshiN)
- [Edax_AutoLearning_Tool](https://github.com/sensuikan1973/Edax_AutoLearning_Tool)
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
