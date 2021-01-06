import 'package:meta/meta.dart';
import 'edax_command.dart' as edax;

class EdaxRunnerCommandBuilder {
  String bookDeviate(String bookFile, String move, int errLowerBound, int errUpperBound) => '''
${edax.playMove(move)}
${edax.bookDeviate(errLowerBound, errUpperBound)}
${edax.bookSave(bookFile)}
${edax.bookFix()}
$eocCommand
''';

  String playGameEdaxVsEdax(String move, [int bookRandomness = 0]) => '''
${edax.setBookRandomness(bookRandomness)}
${edax.playMove(move)}
${edax.playGameEdaxVsEdax()}
${edax.bookStore()}
$eocCommand
''';

  String bookFix() => '''
${edax.bookFix()}
$eocCommand
''';

  String quit() => edax.quit();

  // command list separation.
  // "version" output is stderr.
  // See: https://github.com/abulmo/edax-reversi/blob/01899aecce8bc780517149c80f178fb478a17a0b/src/main.c#L29
  @visibleForTesting
  String get eocCommand => 'version';
}
