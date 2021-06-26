import 'package:edax_runner/edax_runner_command.dart';
import 'package:test/test.dart';

void main() {
  test('bookDeviate', () {
    const bookFile = 'foo/book.dat';
    const move = 'F5F4f3';
    const errLowerBound = 1;
    const errUpperBound = 2;
    final output = bookDeviate(bookFile, move, errLowerBound, errUpperBound);
    expect(
      output,
      '''
init
play $move
book deviate $errLowerBound $errUpperBound
book fix
book save $bookFile
$eocCommand
''',
    );
  });

  test('playGameEdaxVsEdax', () {
    const bookFile = 'foo/book.dat';
    const move = 'f5F6F7g7';
    final output = playGameEdaxVsEdax(bookFile, move);
    expect(
      output,
      '''
init
set book-randomness 0
play $move
${List<String>.filled(60, 'go').join('\n')}
book store
book save $bookFile
$eocCommand
''',
    );
  });
}
