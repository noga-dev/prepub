import 'package:prepub/prepub.dart' as prepub;
import 'package:test/test.dart';

void main() {
  group('dart.io', () {
    test('## [Unreleased patch]', () {
      final result = prepub.isChangelogFormatValid(
        fileList: [
          'test/repo/packages/format_fail1/CHANGELOG.md',
        ],
      );
      expect(result, false);
    });
  });
}
