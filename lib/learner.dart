import 'dart:convert';
import 'dart:io';

import 'converter_text_to_command.dart';

class Learner {
  Learner(this._bookFile, this._learningListFile);

  final String _bookFile;
  final String _learningListFile;
  final String _learnedLogFile = 'learned_log.txt';

  Future<String> getNextLearningCommand() async {
    final file = File(_learningListFile);
    final nextLearningText = await file.openRead().transform(utf8.decoder).transform(const LineSplitter()).first;
    return convertTextToCommand(nextLearningText, _bookFile);
  }

  Future<void> removeLearnedText() async {
    final srcFile = File(_learningListFile);
    final lines = await srcFile.readAsLines();
    final learnedText = lines.removeAt(0);
    final logFile = File(_learnedLogFile);
    await logFile.writeAsString(learnedText);
    await srcFile.writeAsString(lines.join('\n'));
  }
}
