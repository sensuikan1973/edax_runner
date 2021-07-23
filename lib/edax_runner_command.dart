import 'package:meta/meta.dart';
import 'edax_command.dart' as edax;

String bookDeviate(final String bookFile, final String move, final int errLowerBound, final int errUpperBound) => '''
${edax.init()}
${edax.playMove(move)}
${edax.bookDeviate(errLowerBound, errUpperBound)}
${edax.bookFix()}
${edax.bookSave(bookFile)}
$eocCommand
''';

String playGameEdaxVsEdax(final String bookFile, final String move, [final int bookRandomness = 0]) => '''
${edax.init()}
${edax.setBookRandomness(bookRandomness)}
${edax.playMove(move)}
$_go60times
${edax.bookStore()}
${edax.bookSave(bookFile)}
$eocCommand
''';

String bookFix() => '''
${edax.bookFix()}
$eocCommand
''';

String exit() => edax.exit();

final _go60times = List<String>.filled(60, edax.goEdax()).join('\n');

// command list separation.
@visibleForTesting
String get eocCommand => edax.bookStats();
