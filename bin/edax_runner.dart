import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  print('edax binary path: $_edaxBinPath'); // ignore: avoid_print

  final sampleCommandList = await Process.start('echo', ['hint 1\n version\n hint 2\n version\n']);
  final edax = await Process.start('./$_edaxBinPath', []);

  // wait edax loading data
  await Future<void>.delayed(const Duration(seconds: 20));

  // ref: https://stackoverflow.com/questions/59746768/dart-how-to-pass-data-from-one-process-to-another-via-streams
  await sampleCommandList.stdout
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .map((cmd) => '$cmd\n')
      .transform(utf8.encoder)
      .pipe(edax.stdin);

  await edax.stdout.pipe(stdout);
  await edax.stderr.pipe(stderr);
}

String get _edaxBinPath {
  if (Platform.isLinux) return 'bin/lEdax-x64-modern';
  if (Platform.isMacOS) return 'bin/mEdax';
  if (Platform.isWindows) return 'bin/wEdax-x64-modern.exe';
  throw Exception('${Platform.operatingSystem} is not supported');
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
// 3. version (stderr) を listen してログを残していく感じ
