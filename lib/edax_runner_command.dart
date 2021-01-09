import 'package:meta/meta.dart';
import 'edax_command.dart' as edax;

String bookDeviate(String bookFile, String move, int errLowerBound, int errUpperBound) => '''
${edax.init()}
${edax.playMove(move)}
${edax.bookDeviate(errLowerBound, errUpperBound)}
${edax.bookFix()}
${edax.bookSave(bookFile)}
$eocCommand
''';

String playGameEdaxVsEdax(String bookFile, String move, [int bookRandomness = 0]) => '''
${edax.init()}
${edax.setBookRandomness(bookRandomness)}
${edax.playMove(move)}
${List<String>.filled(60, edax.goEdax()).join('\n')}
${edax.bookStore()}
${edax.bookSave(bookFile)}
$eocCommand
''';

String bookFix() => '''
${edax.bookFix()}
$eocCommand
''';

String exit() => edax.exit();

// command list separation.
@visibleForTesting
String get eocCommand => edax.bookInfo();

String get eocText =>
    'Hash balance:'; // See: https://github.com/abulmo/edax-reversi/blob/01899aecce8bc780517149c80f178fb478a17a0b/src/book.c#L2106
