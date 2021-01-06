import 'edax_runner_command.dart';

// [1 3] f5f6f7
final _bookDeviateRegexp = RegExp(r'^(\[)(\d+)(\s+)(\d+)(\])(\s+)(([a-hA-H]{1}[1-8]{1})+)$');

// 3,f5f6f7
final _edaxVsEdaxWithRandomnessRegexp = RegExp(r'^(\d+)(,)(([a-hA-H]{1}[1-8]{1})+)$');

// f5f6f7
final _edaxVsEdaxRegexp = RegExp(r'^([a-hA-H]{1}[1-8]{1})+$');

String convertTextToCommand(String line, String bookFile) {
  final str = line.trim();
  if (str.contains('/')) throw Exception('$str is comment');
  if (str == 'fix' || str == 'exit') return str;
  if (_edaxVsEdaxRegexp.hasMatch(str)) return playGameEdaxVsEdax(str);
  if (_edaxVsEdaxWithRandomnessRegexp.hasMatch(str)) {
    final match = _edaxVsEdaxWithRandomnessRegexp.firstMatch(str);
    return playGameEdaxVsEdax(match.group(3), int.parse(match.group(1)));
  }
  if (_bookDeviateRegexp.hasMatch(str)) {
    final match = _bookDeviateRegexp.firstMatch(str);
    return bookDeviate(bookFile, match.group(7), int.parse(match.group(2)), int.parse(match.group(4)));
  }

  throw Exception('$str is not supported format');
}
