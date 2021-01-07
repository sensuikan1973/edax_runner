import 'package:edax_runner/edax_runner_command.dart';
import 'package:test/test.dart';

void main() {
  test('bookDeviate', () {
    const bookFile = 'foo/book.dat';
    const move = 'F5F4f3';
    const errLowerBound = 1;
    const errUpperBound = 2;
    final output = bookDeviate(bookFile, move, errLowerBound, errUpperBound);
    expect(output, '''
play $move
book deviate $errLowerBound $errUpperBound
book save $bookFile
book fix
$eocCommand
''');
  });

  test('playGameEdaxVsEdax', () {
    const move = 'f5F6F7g7';
    final output = playGameEdaxVsEdax(move);
    expect(output, '''
set book-randomness 0
play $move
mode 2
book store
$eocCommand
''');
  });
}