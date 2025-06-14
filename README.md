# edax_runner

![Dart CI](https://github.com/sensuikan1973/edax_runner/workflows/Dart%20CI/badge.svg)

<p align="center">
<img src="https://github.com/sensuikan1973/edax_runner/blob/main/resources/logo.png?raw=true" alt="edax-runner" />
</p>

**tiny tool for [edax-reversi](https://github.com/sensuikan1973/edax-reversi) auto learning**.

- **you can write learning list as simple format txt**.
  - you can also check the logs.
- **Mac, Windows, Linux** are supported.

![demo](https://github.com/sensuikan1973/edax_runner/blob/main/resources/demo.gif)

## Usage

1. download the Asset from the [latest Release](https://github.com/sensuikan1973/edax_runner/releases/latest).
2. edit `learning_list.txt` which you want to let edax learn.
3. edit `edax.ini` which you like.
4. [optional] add your `book.dat` to `data/book.dat`.
5. run edax_runner.

<details><summary>Mac</summary>

```sh
./edax_runner
```

</details>

<details><summary>Windows</summary>

```sh
start ./edax_runner.exe
```

</details>

<details><summary>Linux</summary>

```sh
./edax_runner
```

</details>

### how to write learning_list.txt ?

There are **only 3 rules**. Example is [here](https://github.com/sensuikan1973/edax_runner/blob/main/resources/learning_list.txt).

| purpose                        | format                                 | example                |
| :----------------------------- | :------------------------------------- | :--------------------- |
| learn one game of edax vs edax | `{book-randomness},{move}`             | `2,F5F6F7F8`           |
| `book deviate` command         | `[relativeError absoluteError] {move}` | `[1 1] F5F6F7F8`       |
| comment                        | `// {your comment}`                    | `// I like Brightwell` |
| `book fix` command             | `fix`                                  | `fix`                  |

- NOTE
  - The default value of `book-randomness` is `0`
  - What's `book deviate` ?: See [edax document](https://sensuikan1973.github.io/edax-reversi/book_8c.html#ae9ee489a468274fd83808c53da0418c9), [Choirokoitia document](https://choi.lavox.net/edax/start)

## References

- **[edax-reversi](https://github.com/abulmo/edax-reversi)**
  - [code/releases archive](https://code.google.com/archive/p/edax-reversi/downloads)
  - [website archive](https://archive.is/KshiN)
  - [document](https://sensuikan1973.github.io/edax-reversi/)
- [libedax4dart](https://pub.dev/packages/libedax4dart)
- [Edax_AutoLearning_Tool](https://github.com/sensuikan1973/Edax_AutoLearning_Tool): original tool. See **[issues/1](https://github.com/sensuikan1973/Edax_AutoLearning_Tool/issues/1)**.
- [Choirokoitia | Edax](https://choi.lavox.net/edax/start): great edax documents (Japanese)
