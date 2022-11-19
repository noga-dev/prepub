import 'dart:io';

/// Check if changelog's head (latest entry) matches expected format
bool isChangelogFormatValid({
  required List<String> fileList,
  List<String> exclusions = const [],
}) {
  final list = fileList.where((e) => e.endsWith('CHANGELOG.md'));

  final files = list.map((e) => File(e));
  for (var e in files) {
    if (!RegExp(r'^#+\s(\[|\d)[A-Za-z0-9 _\/\.\]\-\+]*$')
        .hasMatch(e.readAsLinesSync().first)) {
      print('Invalid changelog format');
      return false;
    }
  }

  return true;
}
