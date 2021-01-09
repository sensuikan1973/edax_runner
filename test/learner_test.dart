import 'dart:io';
import 'package:edax_runner/edax_runner_command.dart';
import 'package:edax_runner/learner.dart';
import 'package:test/test.dart';

Future<void> main() async {
  const bookFile = 'dummy';
  const learningListFile = 'test/learning_list_test.txt';
  const learnedLogFile = 'test/learned_log.txt';
  final learner = Learner(bookFile, learningListFile, learnedLogFile);

  final srcFile = File(learningListFile);
  final logFile = File(learnedLogFile);
  if (srcFile.existsSync()) srcFile.deleteSync();
  if (logFile.existsSync()) logFile.deleteSync();

  const firstLine = '// comment_1';
  const secondLine = '// comment_2';
  const thirdLine = 'F5F6E6F4G5E7E3F3C5C4G3C6D6D7C3C2B5D3B4E2F2H3F1D1D2G4G6C1E1B6C7D8F7H4F8G7';
  await srcFile.writeAsString('$firstLine\n$secondLine\n$thirdLine');

  test('getNextLearningCommand', () async {
    final command = await learner.getNextLearningCommand();
    expect(command, playGameEdaxVsEdax(bookFile, thirdLine));
  });

  test('removeLearnedText', () async {
    await learner.removeLearnedText();
    final logLines = await logFile.readAsLines();
    expect(logLines.first, firstLine);
    expect(logLines[1], secondLine);
    expect(logLines[2], thirdLine);

    final srcLines = await srcFile.readAsLines();
    expect(srcLines, isEmpty);
  });
}
