import 'package:prepub/prepub.dart' as prepub;
import 'package:test/test.dart';

void main() {
  group('good examples', () {
    final args = [
      '-a',
      'format',
      '-f',
      '.github/workflows/ci-cd.yml .gitignore README.md ROADMAP.md packages/flutter_riverpod/test/version_test.dart packages/hooks_riverpod/lib/src/consumer.dart packages/hooks_riverpod/pubspec.yaml packages/hooks_riverpod/test/version_test.dart packages/riverpod_annotation/CHANGELOG.md packages/riverpod_annotation/lib/riverpod_annotation.dart packages/riverpod_annotation/pubspec.yaml packages/riverpod_generator/CHANGELOG.md packages/riverpod_generator/pubspec.yaml packages/riverpod_generator/test/async_notifier_test.dart packages/riverpod_generator/test/async_test.dart packages/riverpod_generator/test/auto_dispose_test.dart packages/riverpod_generator/test/integration/async.dart packages/riverpod_generator/test/integration/auto_dispose.dart packages/riverpod_generator/test/integration/hash/hash1.dart packages/riverpod_generator/test/integration/sync.dart packages/riverpod_generator/test/sync_test.dart packages/riverpod_graph/bin/main.dart packages/riverpod_graph/lib/src/analyze.dart packages/riverpod_graph/test/integration/generated/generated_test.dart packages/riverpod_graph/test/integration/generated/golden/lib/main.dart packages/riverpod_graph/test/integration/generated/golden/lib/sync.dart packages/riverpod_lint_flutter_test/pubspec.yaml website/docs/cookbooks/search_as_we_type.mdx website/docs/getting_started.mdx website/docs/getting_started_hello_world_dart.dart website/docs/getting_started_hello_world_flutter.dart website/docs/getting_started_hello_world_hooks.dart website/docs/providers/change_notifier_provider.mdx website/docs/providers/future_provider.mdx website/docs/providers/future_provider/config_consumer.dart website/docs/providers/future_provider/config_provider.dart website/docs/providers/stream_provider.mdx website/i18n/bn/docusaurus-plugin-content-docs/current/cookbooks/search_as_we_type.mdx website/i18n/bn/docusaurus-plugin-content-docs/current/getting_started.mdx website/i18n/bn/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/bn/docusaurus-theme-classic/footer.json website/i18n/de/docusaurus-plugin-content-docs/current/cookbooks/search_as_we_type.mdx website/i18n/de/docusaurus-plugin-content-docs/current/getting_started.mdx website/i18n/de/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/es/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/es/docusaurus-plugin-content-docs/current/providers/stream_provider.mdx website/i18n/fr/code.json website/i18n/fr/docusaurus-plugin-content-docs/current/cookbooks/testing.mdx website/i18n/fr/docusaurus-plugin-content-docs/current/migration/0.14.0_to_1.0.0.mdx website/i18n/fr/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/fr/docusaurus-plugin-content-docs/current/providers/stream_provider.mdx website/i18n/fr/docusaurus-theme-classic/footer.json website/i18n/it/docusaurus-plugin-content-docs/current/cookbooks/search_as_we_type.mdx website/i18n/it/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/it/docusaurus-plugin-content-docs/current/providers/stream_provider.mdx website/i18n/it/docusaurus-theme-classic/footer.json website/i18n/ja/docusaurus-plugin-content-docs/current/getting_started.mdx website/i18n/ja/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/ja/docusaurus-theme-classic/footer.json website/i18n/ko/docusaurus-plugin-content-docs/current/cookbooks/search_as_we_type.mdx website/i18n/ko/docusaurus-plugin-content-docs/current/getting_started.mdx website/i18n/ko/docusaurus-plugin-content-docs/current/providers/future_provider.mdx website/i18n/ko/docusaurus-plugin-content-docs/current/providers/stream_provider.mdx website/i18n/ko/docusaurus-theme-classic/footer.json website/package-lock.json website/package.json website/pubspec.yaml website/sidebars.js website/src/components/Banner/index.tsx website/src/components/CodeSnippet/index.tsx website/src/pages/index.tsx website/static/snippets/create.dart website/static/snippets/read.dart website/yarn.lock'
    ];

    group('➡️ -f [files]', () {
      final options = prepub.parseOptions(args);

      group('➡️ inference', () {
        final files = options.files.join(' ');

        test('➡️ format', () {
          expect(files, args[1]);
        });

        test('➡️ length', () {
          expect(files.length, args[1].length);
        });
      });
    });
  });
}
