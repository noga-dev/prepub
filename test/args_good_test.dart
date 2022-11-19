import 'package:prepub/prepub.dart' as prepub;
import 'package:test/test.dart';

void main() {
  group('bad examples', () {
    final args = [
      'sadd',
      'cczs',
      '-dxx',
    ];

    group('➡️ throw', () {
      test('➡️ FormatException', () {
        expect(
          () => prepub.parseOptions(args),
          throwsFormatException,
        );
      });
    });
  });
}
