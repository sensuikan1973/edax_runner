import 'dart:convert';
import 'dart:io';

import 'package:edax_runner/edax_runner_command.dart';
import 'package:edax_runner/learner.dart';

const int _waitEdaxLoadingData = 10;
const String _bookFile = 'data/book.dat';

Future<void> main(List<String> arguments) async {
  stdout.writeln('edax binary path: $_edaxBinPath');

  final edax = await Process.start('./$_edaxBinPath', []);
  stdout.writeln('wait edax loading data: $_waitEdaxLoadingData sec');
  await Future<void>.delayed(const Duration(seconds: _waitEdaxLoadingData));

  final learner = Learner(_bookFile);

  final line = await learner.getNextLearningCommand();
  edax.stdin.writeln(line);

  edax.stderr.listen((event) async {
    stderr.writeln(utf8.decode(event));
  });
  edax.stdout.listen((event) async {
    final output = utf8.decode(event);
    stdout.writeln(output);
    if (!output.contains(eocText)) return;

    await learner.removeLearnedText();

    final line = await learner.getNextLearningCommand();
    edax.stdin.writeln(line);
  });
}

String get _edaxBinPath {
  if (Platform.isLinux) return 'bin/lEdax-x64-modern';
  if (Platform.isMacOS) return 'bin/mEdax';
  if (Platform.isWindows) return 'bin/wEdax-x64-modern.exe';
  throw Exception('${Platform.operatingSystem} is not supported');
}
