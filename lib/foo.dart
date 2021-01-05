import 'dart:io';

String get edaxBinPath {
  if (Platform.isLinux) return 'bin/lEdax-x64-modern';
  if (Platform.isMacOS) return 'bin/mEdax';
  if (Platform.isWindows) return 'bin/wEdax-x64-modern.exe';
  throw Exception('${Platform.operatingSystem} is not supported');
}
