# edax_runner

**Simple tool for auto learning by [edax-reversi](https://github.com/abulmo/edax-reversi)**.  
This tool only passes command list to edax process and catch the logs.

## Usage
easy

1. dowonload Releases (TODO: link)
2. edit `learn_list.txt` which you want to let edax learn
3. `./edax_runner`

## Reference

- **[edax-reversi](https://github.com/abulmo/edax-reversi)**
  - [code/releases archive](https://code.google.com/archive/p/edax-reversi/downloads)
  - [website archive](https://archive.is/KshiN)
- [Edax_AutoLearning_Tool](https://github.com/sensuikan1973/Edax_AutoLearning_Tool): My original tool. This has many issues such as low performance, low maintainability, only Windows etc.
- [Choirokoitia | Edax](https://choi.lavox.net/edax/start)

## Development
![.github/workflows/dartfmt.yaml](https://github.com/sensuikan1973/edax_runner/workflows/.github/workflows/dartfmt.yaml/badge.svg?event=push)
![.github/workflows/dartanalyzer.yaml](https://github.com/sensuikan1973/edax_runner/workflows/.github/workflows/dartanalyzer.yaml/badge.svg?event=push)
![.github/workflows/unit_test.yaml](https://github.com/sensuikan1973/edax_runner/workflows/.github/workflows/unit_test.yaml/badge.svg?event=push)
![.github/workflows/dart2native.yaml](https://github.com/sensuikan1973/edax_runner/workflows/.github/workflows/dart2native.yaml/badge.svg?event=push)

### format
```sh
dartfmt ./ -w -l 120
```
