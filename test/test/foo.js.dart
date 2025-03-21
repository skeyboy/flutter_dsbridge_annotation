// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foo.dart';

// **************************************************************************
// DSBridgeGenerator
// **************************************************************************

// Generated _$Foo class for Foo
class _$Foo extends JavaScriptNamespaceInterface {
  late final Foo _wrappedInstance = Foo();
  Foo get foo => _wrappedInstance;

  @override
  void register() {
    registerFunction(_Method1, functionName: 'Method1');
    registerFunction(_Method2, functionName: 'Method2');
    registerFunction(_testSyn, functionName: 'testSyn');
    registerFunction(_testAsyn, functionName: 'testAsyn');
  }

  @pragma('vm:entry-point')
  void _Method1() {
    debugPrint(
      'Before calling method1 with annotation: isAsync - false  as - Method1',
    );
    _wrappedInstance.method1(); // 调用被包装类的方法
    debugPrint('After calling method1');
  }

  @pragma('vm:entry-point')
  void _Method2(String param1, int param2) {
    debugPrint(
      'Before calling method2 with annotation: isAsync - false  as - Method2',
    );
    _wrappedInstance.method2(param1, param2); // 调用被包装类的方法
    debugPrint('After calling method2');
  }

  @pragma('vm:entry-point')
  String _testSyn(dynamic msg) {
    debugPrint(
      'Before calling testSyn with annotation: isAsync - false  as - testSyn',
    );
    final result = _wrappedInstance.testSyn(msg); // 调用被包装类的方法
    debugPrint('After calling testSyn');
    return result;
  }

  @pragma('vm:entry-point')
  void _testAsyn(dynamic msg, CompletionHandler handler) {
    debugPrint(
      'Before calling testAsyn with annotation: isAsync - false  as - testAsyn',
    );
    _wrappedInstance.testAsyn(msg, handler); // 调用被包装类的方法
    debugPrint('After calling testAsyn');
  }

  void debugPrint(Object? object) {
    // ignore: avoid_print
    print(object);
  }
}
