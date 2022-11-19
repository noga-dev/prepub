import 'dart:developer';
import 'dart:io';

import 'package:prepub/prepub.dart' as prepub;

const _kOnlyMarkdownFilesModifiedMsg = 'Only markdown files were modified.';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('\x1B[33mWarning: Empty args\x1B[0m');
    print(prepub.usageHelp);
    exitCode = 1;
    return;
  }
  late final prepub.Options options;

  try {
    options = prepub.parseOptions(arguments);
  } catch (error, stackTrace) {
    final kExceptionParsingArgsMsg = 'Error parsing args...'
        '\n'
        'Error: $error'
        '\n'
        'StackTrace:$stackTrace';
    log('log:::$kExceptionParsingArgsMsg');
    print('\x1B[31mError: $kExceptionParsingArgsMsg\x1B[0m');
    exitCode = 1;
    return;
  }

  final files = options.files;

  if (files.isNotEmpty &&
      files.every(
        (e) => RegExp(e).hasMatch(
          '^*.(${options.exclusions.join('|')})\$',
        ),
      )) {
    log('log:::$_kOnlyMarkdownFilesModifiedMsg');
    print('\x1B[34m$_kOnlyMarkdownFilesModifiedMsg\x1B[0m');
    exitCode = 0;
    return;
  }

  print('printStart');
  log('logStart');
  print('::set-output name=testval::111');
  log('::set-output name=testval::222');
  print('Found ${files.length} changed files.');
  log('logEnd');
  print('printEnd');
}
