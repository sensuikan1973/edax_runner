import 'package:edax_runner/foo.dart' as foo;

void main(List<String> arguments) {
  print('Hello world: ${foo.calculate()}!'); // ignore: avoid_print
}

// TODO: 実装イメージ
// メッチャ薄い、edax に command 流すだけのツール
// 多機能にはしない
//
// # usage
// 1. 指定のフォーマットで learn_list.txt みたいなファイルに学習させたい棋譜を羅列してもらう
// 2. `./edax_runner` で実行
// 3. 自動で学習されていく
// 4. ui_log あたりを拾って、log を見れるようにしておくと幸せ度が増す。中断させた時に役立つ。
//    中断/終了時に、log 見て諸々こしらえるようにしておくと良さげ。See: https://stackoverflow.com/questions/18448306/how-to-catch-sigint-for-the-current-in-dart
//
// # dev
// 1. learn_list.txt みたいなファイルを edax command として解釈する
// 2. それを echo して pipe して ./bin/mEdax みたいに実行する
