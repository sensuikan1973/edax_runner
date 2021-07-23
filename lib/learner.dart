import 'dart:io';
import 'dart:math';

import 'converter_text_to_command.dart';

class Learner {
  Learner(
    this._bookFile, [
    final String learningListFile = 'learning_list.txt',
    final String learnedLogFile = 'learned_log.txt',
  ])  : _learningListFile = learningListFile,
        _learnedLogFile = learnedLogFile;

  final String _bookFile;
  final String _learningListFile;
  final String _learnedLogFile;

  Future<String> getNextLearningCommand() async {
    final file = File(_learningListFile);
    final lines = await file.readAsLines();
    final nextLearningText = lines.firstWhere((final line) => !line.contains(commentHead), orElse: () => '');
    return convertTextToCommand(nextLearningText, _bookFile);
  }

  Future<void> removeLearnedText() async {
    final srcFile = File(_learningListFile);
    final logFile = File(_learnedLogFile);
    final lines = await srcFile.readAsLines();
    var cnt = 0;
    for (final line in lines) {
      await logFile.writeAsString('$line\n', mode: FileMode.append);
      cnt++;
      if (!line.contains(commentHead)) break;
    }
    lines.removeRange(0, min(cnt, lines.length));
    await srcFile.writeAsString(lines.join('\n'));
  }

  String get eocText =>
      'Best Score Distribution:'; // See: https://github.com/abulmo/edax-reversi/blob/01899aecce8bc780517149c80f178fb478a17a0b/src/book.c#L2565
}
