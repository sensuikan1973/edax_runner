import 'edax_runner_command.dart';

// [1 3] f5f6f7
final _bookDeviateRegexp = RegExp(r'^(\[)(\d+)(\s+)(\d+)(\])(\s+)(([a-hA-H]{1}[1-8]{1})+)$');

// 3,f5f6f7
final _edaxVsEdaxWithRandomnessRegexp = RegExp(r'^(\d+)(,)(([a-hA-H]{1}[1-8]{1})+)$');

// f5f6f7
final _edaxVsEdaxRegexp = RegExp(r'^([a-hA-H]{1}[1-8]{1})+$');

const commentHead = '//';

String convertTextToCommand(String line, String bookFile) {
  final str = line.trim();
  if (str.contains(commentHead)) throw Exception('$str is comment');
  if (str == 'exit' || str.isEmpty) return 'exit';
  if (str == 'fix') return bookFix();
  if (_edaxVsEdaxRegexp.hasMatch(str)) return playGameEdaxVsEdax(bookFile, str);
  if (_edaxVsEdaxWithRandomnessRegexp.hasMatch(str)) {
    final match = _edaxVsEdaxWithRandomnessRegexp.firstMatch(str);
    return playGameEdaxVsEdax(bookFile, match!.group(3) ?? '', int.parse(match.group(1) ?? ''));
  }
  if (_bookDeviateRegexp.hasMatch(str)) {
    final match = _bookDeviateRegexp.firstMatch(str);
    return bookDeviate(
        bookFile, match!.group(7) ?? '', int.parse(match.group(2) ?? ''), int.parse(match.group(4) ?? ''));
  }

  throw Exception('$str is not supported format');
}
