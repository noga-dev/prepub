import 'dart:io';

import 'package:prepub/prepub.dart' as prepub;
import 'package:prepub/src/constants.dart';

void isEmpty(bool value) {
  if (value) {
    print('${kTextColorYellow}Warning: Empty args$kTextColorSuffix');
    print(prepub.usageHelp);
    exit(1);
  }
}

prepub.Options parseArgs(List<String> args) {
  try {
    return prepub.parseOptions(args);
  } catch (error, stackTrace) {
    print(
        '${kTextColorRed}Error: Error parsing args...\nError: $error\nStackTrace:$stackTrace$kTextColorSuffix');
    print(prepub.usageHelp);
    exit(1);
  }
}

void main(List<String> args) {
  isEmpty(args.isEmpty);

  final prepub.Options options = parseArgs(args);

  final envOutputFile = File(Platform.environment['GITHUB_OUTPUT'] ?? '');
  final envOutputFileSink = envOutputFile.openWrite(
    mode: FileMode.writeOnlyAppend,
  );

  final files = options.files;

  if (files.isNotEmpty &&
      files.every(
        (e) => RegExp(e).hasMatch(
          '^*.(${options.exclusions.join('|')})\$',
        ),
      )) {
    print(
        '${kTextColorCyan}Only excluded files were modified.$kTextColorSuffix');
    envOutputFileSink.close();
    exit(0);
  }

  // envOutputFileSink.writeln('name=testval');

  switch (options.action) {
    case prepub.Action.checkChangelogSync:
      prepub.updatePubspecVersion(
        exclusions: options.exclusions,
        files: files,
      );
      break;
    case prepub.Action.checkChangelogFormat:
      prepub.isChangelogFormatValid(
        exclusions: options.exclusions,
        fileList: files,
      );
      break;
    case prepub.Action.updatePubspecVersion:
      prepub.validateChangelogSync(
        exclusions: options.exclusions,
        files: files,
      );
      break;
  }

  envOutputFileSink.close();
}
