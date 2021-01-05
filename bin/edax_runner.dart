import 'dart:convert';
import 'dart:io';
import 'package:edax_runner/foo.dart' as foo;

Future<void> main(List<String> arguments) async {
  print('edax binary path: ${foo.edaxBinPath}'); // ignore: avoid_print

  final sampleCommandList = await Process.start('echo', ['hint 1\n version\n hint 2\n version\n']);
  final edax = await Process.start('./${foo.edaxBinPath}', []);

  // wait edax loading data
  await Future<void>.delayed(const Duration(seconds: 20));

  await sampleCommandList.stdout
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .map((cmd) => '$cmd\n')
      .transform(utf8.encoder)
      .pipe(edax.stdin);

  await edax.stdout.pipe(stdout);
  await edax.stderr.pipe(
      stderr); // See: https://github.com/abulmo/edax-reversi/blob/01899aecce8bc780517149c80f178fb478a17a0b/src/main.c#L29
}

// TODO: 実装イメージ
// メッチャ薄い、edax に command 流すだけのツール
// 多機能にはしない
//
// # usage
// 1. 指定のフォーマットで learning_list.txt みたいなファイルに学習させたい棋譜を羅列してもらう
// 2. `./edax_runner` で実行
// 3. 自動で学習されていく
// 4. ui_log あたりを拾って、log を見れるようにしておくと幸せ度が増す。中断させた時に役立つ。
//    中断/終了時に、log 見て諸々こしらえるようにしておくと良さげ。See: https://stackoverflow.com/questions/18448306/how-to-catch-sigint-for-the-current-in-dart
//
// # dev
// 1. learning_list.txt みたいなファイルを edax command として解釈する
// 2. それを echo して pipe して ./bin/mEdax みたいに実行する
