import 'edax_command.dart' as edax;

class EdaxRunnerCommandBuilder {
  String bookDeviate(String bookFile, String move, int errLowerBound, int errUpperBound) => '''
${edax.playMove(move)}
${edax.bookDeviate(errLowerBound, errUpperBound)}
${edax.bookSave(bookFile)}
${bookFix()}
$_eocCommand
''';

  String playGameEdaxVsEdax(String move, int bookRandomness) => '''
${edax.setBookRandomness(bookRandomness)}
${edax.playMove(move)}
${edax.playGameEdaxVsEdax()}
${edax.bookStore()}
$_eocCommand
''';

  String bookFix() => '''
${edax.bookFix()}
$_eocCommand
''';

  String quit() => edax.quit();

  // command list separation.
  // "version" output is stderr.
  // See: https://github.com/abulmo/edax-reversi/blob/01899aecce8bc780517149c80f178fb478a17a0b/src/main.c#L29
  String get _eocCommand => 'version';
}
