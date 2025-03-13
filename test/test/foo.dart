import 'package:dsbridge_flutter/dsbridge_flutter.dart';
import 'package:flutter_dsbridge_annotation/flutter_dsbridge_annotation.dart';
part 'foo.js.dart';

@DSBridge(name: 'MyClass', enableDebug: true)
class Foo extends _$Foo {
  @dsBridge(as: 'Method 1')
  void method1() {
    print('Original method1');
  }

  @dsBridge(as: 'Method 2')
  void method2(String param1, int param2) {
    print('Original method2 with params: $param1, $param2');
  }

  @dsBridge(as: 'testSyn')
  String testSyn(dynamic msg) {
    return "$msg［syn call］";
  }

  @dsBridge(as: 'testAsyn')
  void testAsyn(dynamic msg, CompletionHandler handler) {
    handler.complete("$msg [ asyn call]");
  }
}
