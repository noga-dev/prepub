import 'package:prepub/prepub.dart' as prepub;
import 'package:test/test.dart';

void main() {
  group('dart.io', () {
    test('## 2.1.1', () {
      final result = prepub.isChangelogFormatValid(
        fileList: [
          'test/repo/packages/format_pass1/CHANGELOG.md',
        ],
      );
      expect(result, true);
    });
  });
}
