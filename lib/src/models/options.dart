import 'package:build_cli_annotations/build_cli_annotations.dart';
import 'package:prepub/src/constants.dart';

part 'options.g.dart';

List<String> _extractListFromString(String? arg) => arg?.split(' ') ?? [];

// coverage:ignore-start
Action _extractValidationTypeFromString(String? arg) {
  switch (arg) {
    case _kActionTypeSync:
      return Action.checkChangelogSync;
    case _kActionTypeFormat:
      return Action.checkChangelogFormat;
    case _kActionTypeUpdate:
      return Action.updatePubspecVersion;
    default:
      throw ArgumentError.value(arg, 'action', 'must be provided');
  }
}
// coverage:ignore-end

enum Action {
  checkChangelogSync,
  checkChangelogFormat,
  updatePubspecVersion,
}

// enum can't be const https://github.com/dart-lang/language/issues/1811
const _kActionTypeUpdate = 'update';
const _kActionTypeSync = 'sync';
const _kActionTypeFormat = 'format';

// coverage:ignore-line
String get usageHelp => _$parserForOptions.usage;

// coverage:ignore-line
@CliOptions()
class Options {
  /// Populates final and non-null fields as long as there are matching
  /// constructor parameters.
  Options({
    required this.files,
    required this.packages,
    required this.exclusions,
    required this.action,
  });

  /// Validation type. Example:
  /// sync, format, update
  @CliOption(
    abbr: 'a',
    help: '${kTextColorCyan}The type of action to perform.$kTextColorSuffix',
    allowed: [
      _kActionTypeSync,
      _kActionTypeFormat,
      _kActionTypeUpdate,
    ],
    allowedHelp: {
      '$kTextColorMagenta$_kActionTypeSync$kTextColorSuffix':
          '${kTextColorCyan}Ensure changelog was updated if a package had changes.$kTextColorSuffix',
      '$kTextColorMagenta$_kActionTypeFormat$kTextColorSuffix':
          '${kTextColorCyan}Validate changelog version format.$kTextColorSuffix',
      '$kTextColorMagenta$_kActionTypeUpdate$kTextColorSuffix':
          '${kTextColorCyan}Update pubspec\'s version to the latest entry in changelog.$kTextColorSuffix',
    },
    convert: _extractValidationTypeFromString,
  )
  final Action action;

  /// The list of files. Example format:
  /// .github/workflows/ci-cd.yml .gitignore README.md ROADMAP.md packages/flutter_riverpod/test/version_test.dart packages/hooks_riverpod/lib/src/consumer.dart packages/hooks_riverpod/pubspec.yaml packages/hooks_riverpod/test/version_test.dart packages/riverpod_annotation/CHANGELOG.md packages/riverpod_annotation/lib/riverpod_annotation.dart packages/riverpod_annotation/pubspec.yaml packages/riverpod_generator/CHANGELOG.md packages/riverpod_generator/pubspec.yaml packages/riverpod_generator/test/async_notifier_test.dart packages/riverpod_generator/test/async_test.dart packages/riverpod_generator/test/auto_dispose_test.dart packages/riverpod_generator/test/integration/async.dart packages/riverpod_generator/test/integration/auto_dispose.dart packages/riverpod_generator/test/integration/hash/hash1.dart packages/riverpod_generator/test/integration/sync.dart packages/riverpod_generator/test/sync_test.dart packages/riverpod_graph/bin/main.dart packages/riverpod_graph/lib/src/analyze.dart packages/riverpod_graph/test/integration/generated/generated_test.dart packages/riverpod_graph/test/integration/generated/golden/lib/main.dart packages/riverpod_graph/test/integration/generated/golden/lib/sync.dart packages/riverpod_lint_flutter_test/pubspec.yaml website/docs/cookbooks/search_as_we_type.mdx website/docs/getting_started.mdx website/docs/getting_started_hello_world_dart.dart website/docs/getting_started_hello_world_flutter.dart website/docs/getting_started_hello_world_hooks.dart website/docs/providers/change_notifier_provider.mdx website/docs/providers/future_provider.mdx website/docs/providers/future_provider/config_consumer.dart website/docs/providers/future_provider/config_provider.dart website/docs/providers/stream_provider.mdx website/i18n/bn/docusaurus-plugin-content-docs/current/cookbooks/search_as_we_type.mdx website/i18n/bn/docusaurus-plugin-content-docs/current/getting_started.mdx website/i18n/bn/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/bn/docusaurus-theme-classic/footer.json website/i18n/de/docusaurus-plugin-content-docs/current/cookbooks/search_as_we_type.mdx website/i18n/de/docusaurus-plugin-content-docs/current/getting_started.mdx website/i18n/de/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/es/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/es/docusaurus-plugin-content-docs/current/providers/stream_provider.mdx website/i18n/fr/code.json website/i18n/fr/docusaurus-plugin-content-docs/current/cookbooks/testing.mdx website/i18n/fr/docusaurus-plugin-content-docs/current/migration/0.14.0_to_1.0.0.mdx website/i18n/fr/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/fr/docusaurus-plugin-content-docs/current/providers/stream_provider.mdx website/i18n/fr/docusaurus-theme-classic/footer.json website/i18n/it/docusaurus-plugin-content-docs/current/cookbooks/search_as_we_type.mdx website/i18n/it/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/it/docusaurus-plugin-content-docs/current/providers/stream_provider.mdx website/i18n/it/docusaurus-theme-classic/footer.json website/i18n/ja/docusaurus-plugin-content-docs/current/getting_started.mdx website/i18n/ja/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/ja/docusaurus-theme-classic/footer.json website/i18n/ko/docusaurus-plugin-content-docs/current/cookbooks/search_as_we_type.mdx website/i18n/ko/docusaurus-plugin-content-docs/current/getting_started.mdx website/i18n/ko/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/ko/docusaurus-plugin-content-docs/current/providers/stream_provider.mdx website/i18n/ko/docusaurus-theme-classic/footer.json website/package-lock.json website/package.json website/pubspec.yaml website/sidebars.js website/src/components/Banner/index.tsx website/src/components/CodeSnippet/index.tsx website/src/pages/index.tsx website/static/snippets/create.dart website/static/snippets/read.dart website/yarn.lock
  @CliOption(
    abbr: 'f',
    help: '${kTextColorCyan}The list of changed files (based on results'
        ' from tj-actions/changed-files@v32).$kTextColorSuffix e.g.  '
        '$kTextColorGreen".gitignore README.md CHANGELOG.md LICENSE"$kTextColorSuffix',
    convert: _extractListFromString,
  )
  final List<String> files;

  // TODO(noga-dev): infer?
  /// The packages list folder. Example:
  /// packages/package1
  /// packages/package2
  @CliOption(
    abbr: 'p',
    help:
        '${kTextColorCyan}The relative path to the packages.$kTextColorSuffix',
    convert: _extractListFromString,
  )
  final List<String> packages;

  // TODO(noga-dev): accept regex instead to account for files/paths/etc.?
  /// Exception formats. Example:
  /// md, mdx
  @CliOption(
    abbr: 'e',
    help:
        '${kTextColorCyan}List of file formats to ignore separated by a single space.$kTextColorSuffix'
        ' e.g. $kTextColorGreen"mdx md txt"$kTextColorSuffix',
    convert: _extractListFromString,
  )
  final List<String> exclusions;
}
