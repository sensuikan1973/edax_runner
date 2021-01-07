import 'dart:io';

import 'converter_text_to_command.dart';
import 'edax_runner_command.dart';

class Learner {
  Learner(this._bookFile, this._learningListFile, [String learnedLogFile = 'learned_log.txt']): _learnedLogFile = learnedLogFile;

  final String _bookFile;
  final String _learningListFile;
  final String _learnedLogFile;

  Future<String> getNextLearningCommand() async {
    final file = File(_learningListFile);
    final lines = await file.readAsLines();
    final nextLearningText = lines.firstWhere((line) => !line.contains(commentHead));
    return convertTextToCommand(nextLearningText, _bookFile);
  }

  Future<void> removeLearnedText() async {
    final srcFile = File(_learningListFile);
    final logFile = File(_learnedLogFile);
    final lines = await srcFile.readAsLines();
    var commandTextCount = 0;
    for (final line in lines) {
      await logFile.writeAsString('$line\n', mode: FileMode.append);
      if (!line.contains(commentHead)) commandTextCount += 1;
      if (commandTextCount > 1) break;
    }
    lines.removeRange(0, commandTextCount + 1);
    await srcFile.writeAsString(lines.join('\n'));
  }
}
