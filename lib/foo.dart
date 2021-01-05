import 'dart:io';

String get edaxBinPath {
  if (Platform.isLinux) return 'path/to/lEdax-x64-modern';
  if (Platform.isMacOS) return 'path/to/mEdax';
  if (Platform.isWindows) return 'path/to/wEdax-x64-modern.exe';
  throw Exception('${Platform.operatingSystem} is not supported');
}
