import 'dart:developer';
import 'dart:io';

import 'package:prepub/prepub.dart' as prepub;

void main(List<String> arguments) {
  final options = prepub.parseOptions(arguments);
  final files = options.files;

  if (files.every((e) => RegExp(e).hasMatch(r'*.(md|mdx)$'))) {
    log('[Log] Only markdown files were modified.');
    print('[Print] Only markdown files were modified.');
    exitCode = 0;
  }

  print('printStart');
  log('logStart');
  print('::set-output name=testval::111');
  log('::set-output name=testval::222');
  print('Found ${files.length} changed files.');
  log('logEnd');
  print('printEnd');
}
