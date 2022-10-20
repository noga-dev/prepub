import 'dart:developer';
import 'dart:io';

import 'package:prepub/prepub.dart' as prepub;

void main(List<String> arguments) {
  final options = prepub.parseOptions(arguments);
  final files = options.files;

  if (files.every((e) => RegExp(e).hasMatch(r'*.(md|mdx)$'))) {
    log('Only markdown files were modified.');
    exitCode = 0;
  }

  print('printStart');
  log('logStart');
  print('::set-output name=testval::111');
  log('::set-output name=testval::222');
  print('Hello world: ${files.length}!');
  log('logEnd');
  print('printEnd');
}
