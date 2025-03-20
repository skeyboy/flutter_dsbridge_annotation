import 'package:flutter_test/flutter_test.dart';
import 'test/foo.dart';

void main() {
  final foo = Foo();
  test('foo functions map', () {
    assert(foo.functionMap.isNotEmpty, "foo functions shoud not empty");
    assert(
      foo.functionMap.keys.length == 4,
      'we registe 4 tunctions ,functions count is 4',
    );
  });
}
