// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// CliGenerator
// **************************************************************************

Options _$parseOptionsResult(ArgResults result) => Options(
      files: filesToList(result['files'] as String?),
      assertChangelogUpdated: result['assert-changelog-updated'] as bool,
    );

ArgParser _$populateOptionsParser(ArgParser parser) => parser
  ..addOption(
    'files',
    abbr: 'f',
    help: 'Required. The changed files.',
  )
  ..addFlag(
    'assert-changelog-updated',
    abbr: 'c',
    help: 'Prints usage information.',
    defaultsTo: true,
    negatable: false,
  );

final _$parserForOptions = _$populateOptionsParser(ArgParser());

Options parseOptions(List<String> args) {
  final result = _$parserForOptions.parse(args);
  return _$parseOptionsResult(result);
}
