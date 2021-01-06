import 'package:edax_runner/converter_text_to_command.dart';
import 'package:edax_runner/edax_runner_command.dart';
import 'package:test/test.dart';

void main() {
  const bookFile = 'foo/book.dat';

  test('book deviate', () {
    const move = 'f5F6F7g7';
    const errLowerBound = 1;
    const errUpperBound = 3;
    const line = '[$errLowerBound $errUpperBound] $move';
    final output = convertTextToCommand(line, bookFile);
    expect(output, bookDeviate(bookFile, move, errLowerBound, errUpperBound));
  });

  test('edax vs edax', () {
    const move = 'f5F6F7g7';
    const line = move;
    final output = convertTextToCommand(line, bookFile);
    expect(output, playGameEdaxVsEdax(move));
  });

  test('edax vs edax with randomness', () {
    const move = 'f5F6F7g7';
    const randomness = 3;
    const line = '$randomness,$move';
    final output = convertTextToCommand(line, bookFile);
    expect(output, playGameEdaxVsEdax(move, randomness));
  });
}
