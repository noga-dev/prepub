// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// CliGenerator
// **************************************************************************

T _$enumValueHelper<T>(Map<T, String> enumValues, String source) =>
    enumValues.entries
        .singleWhere(
          (e) => e.value == source,
          orElse: () => throw ArgumentError(
            '`$source` is not one of the supported values: '
            '${enumValues.values.join(', ')}',
          ),
        )
        .key;

Options _$parseOptionsResult(ArgResults result) => Options(
      files: _extractListFromString(result['files'] as String?),
      packages: _extractListFromString(result['packages'] as String?),
      exclusions: _extractListFromString(result['exclusions'] as String?),
      action: _extractValidationTypeFromString(result['action'] as String?),
    );

const _$ActionEnumMapBuildCli = <Action, String>{
  Action.checkChangelogSync: 'check-changelog-sync',
  Action.checkChangelogFormat: 'check-changelog-format',
  Action.updatePubspecVersion: 'update-pubspec-version'
};

ArgParser _$populateOptionsParser(ArgParser parser) => parser
  ..addOption(
    'action',
    abbr: 'a',
    help: '\x1B[36mThe type of action to perform.\x1B[0m',
    allowed: ['sync', 'format', 'update'],
    allowedHelp: <String, String>{
      '\x1B[35msync\x1B[0m':
          '\x1B[36mEnsure changelog was updated if a package had changes.\x1B[0m',
      '\x1B[35mformat\x1B[0m':
          '\x1B[36mValidate changelog version format.\x1B[0m',
      '\x1B[35mupdate\x1B[0m':
          "\x1B[36mUpdate pubspec's version to the latest entry in changelog.\x1B[0m"
    },
  )
  ..addOption(
    'files',
    abbr: 'f',
    help:
        '\x1B[36mThe list of changed files (based on results from tj-actions/changed-files@v32).\x1B[0m e.g.  \x1B[32m".gitignore README.md CHANGELOG.md LICENSE"\x1B[0m',
  )
  ..addOption(
    'packages',
    abbr: 'p',
    help: '\x1B[36mThe relative path to the packages.\x1B[0m',
  )
  ..addOption(
    'exclusions',
    abbr: 'e',
    help:
        '\x1B[36mList of file formats to ignore separated by a single space.\x1B[0m e.g. \x1B[32m"mdx md txt"\x1B[0m',
  );

final _$parserForOptions = _$populateOptionsParser(ArgParser());

Options parseOptions(List<String> args) {
  final result = _$parserForOptions.parse(args);
  return _$parseOptionsResult(result);
}
