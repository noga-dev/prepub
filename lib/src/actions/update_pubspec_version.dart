import 'dart:io';

/// Update the version in pubspec to the version
/// in changelog's head
void updatePubspecVersion({
  required List<String> files,
  List<String> exclusions = const [],
}) {
  if (exclusions.isEmpty) {}

  final pubspecList = files.where((e) => e.endsWith('pubspec.yaml'));

  // ignore: unused_local_variable
  final pubspecListFiles = pubspecList.map((e) => File(e));
}
