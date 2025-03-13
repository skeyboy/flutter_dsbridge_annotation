import 'package:flutter_test/flutter_test.dart';
import 'test/foo.dart';

void main() {
  final foo = Foo();
  final fooWrapper = FooWrapper(foo);
  test('inject foo instance', () {
    assert(foo == fooWrapper.foo, "inject instance failed");
  });
}
