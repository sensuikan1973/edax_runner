# edax_runner
**simple cli tool for [edax-reversi](https://github.com/abulmo/edax-reversi)**.

- you only write _learning_list_ txt.
- support Linux, Mac, Windows.

## Usage
1. dowonload edax-runner Release (TODO: add link)
2. edit `learning_list.txt` which you want to let edax learn
3. (option) edit `edax.ini`
4. `./edax_runner`

### How to write learning_list.txt
#### example
```learning_list.txt
// 「deviate 2 4」
[2 4] F5F6E6F4G5E7E3F3C5C4G3C6D6D7C3C2B5D3B4E2F2H3F1D1D2G4G6C1E1B6C7D8F7H4F8G7
// learn one game by「book-randomness 4 & mode 2」
4,F5F6E6D6E7
// learn one game by「book-randomness 2 & mode 2」
2,F5F6E6D6E7
// 「deviate 1 1」
[1 1] F5F6E6F4G5E7E3F3
```

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
