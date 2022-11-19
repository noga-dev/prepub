import 'dart:developer';

const _kRegex = r'^#+\s(\[|\d)[A-Za-z0-9 _\/\.\]\-\+]*$';

const _kOnlyMarkdownFilesMsg = 'Only markdown files were modified.';

/// Check if changelog's head (latest entry) matches expected format
void validateChangelogFormat({
  required String changelogHead,
  required List<String> exceptions,
}) {
  if (!RegExp(_kRegex).hasMatch(changelogHead)) {
    log('log:::$_kOnlyMarkdownFilesMsg');
    print('print:::$_kOnlyMarkdownFilesMsg');
  }
}
