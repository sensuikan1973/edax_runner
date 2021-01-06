import 'dart:convert';
import 'dart:io';

import 'package:edax_runner/edax_runner_command.dart';
import 'package:edax_runner/learner.dart';

const int _waitEdaxLoadingData = 10;
const String _learningListFile = 'learning_list.txt';

Future<void> main(List<String> arguments) async {
  stdout.writeln('edax binary path: $_edaxBinPath');

  final edax = await Process.start('./$_edaxBinPath', []);
  stdout.writeln('wait edax loading data: $_waitEdaxLoadingData sec');
  await Future<void>.delayed(const Duration(seconds: _waitEdaxLoadingData));

  final learner = Learner(_learningListFile);

  final text = 'hint 1\n hint 2'; //learner.getNextLearningCommand();
  edax.stdin.writeln('hint 1\n hint 2\n version \n hint 1');

  edax.stderr.listen((event) {
    stderr.writeln(utf8.decode(event));
    edax.stdin.writeln('hint 3\n exit');
    stdout.writeln('main exit');
  });
  learner.removeLearnedText();
  edax.stdout.listen((event) {
    stdout.writeln(utf8.decode(event));
  });
}

String get _edaxBinPath {
  if (Platform.isLinux) return 'bin/lEdax-x64-modern';
  if (Platform.isMacOS) return 'bin/mEdax';
  if (Platform.isWindows) return 'bin/wEdax-x64-modern.exe';
  throw Exception('${Platform.operatingSystem} is not supported');
}
