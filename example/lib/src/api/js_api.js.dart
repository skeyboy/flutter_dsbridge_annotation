// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'js_api.dart';

// **************************************************************************
// DSBridgeGenerator
// **************************************************************************

// Generated _$JsApi class for JsApi
class _$JsApi extends JavaScriptNamespaceInterface {
  late final JsApi _wrappedInstance = JsApi();
  JsApi get jsapi => _wrappedInstance;

  @override
  void register() {
    registerFunction(_testSyn, functionName: 'testSyn');
    registerFunction(_testAsyn, functionName: 'testAsyn');
    registerFunction(_testNoArgSyn, functionName: 'testNoArgSyn');
    registerFunction(_testNoArgAsyn, functionName: 'testNoArgAsyn');
    registerFunction(_callProgress, functionName: 'callProgress');
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
      'Before calling testAsyn with annotation: isAsync - true  as - testAsyn',
    );
    _wrappedInstance.testAsyn(msg, handler); // 调用被包装类的方法
    debugPrint('After calling testAsyn');
  }

  @pragma('vm:entry-point')
  String _testNoArgSyn(dynamic arg) {
    debugPrint(
      'Before calling testNoArgSyn with annotation: isAsync - false  as - testNoArgSyn',
    );
    final result = _wrappedInstance.testNoArgSyn(arg); // 调用被包装类的方法
    debugPrint('After calling testNoArgSyn');
    return result;
  }

  @pragma('vm:entry-point')
  void _testNoArgAsyn(dynamic arg, CompletionHandler handler) {
    debugPrint(
      'Before calling testNoArgAsyn with annotation: isAsync - true  as - testNoArgAsyn',
    );
    _wrappedInstance.testNoArgAsyn(arg, handler); // 调用被包装类的方法
    debugPrint('After calling testNoArgAsyn');
  }

  @pragma('vm:entry-point')
  void _callProgress(String args, CompletionHandler handler) {
    debugPrint(
      'Before calling callProgress with annotation: isAsync - true  as - callProgress',
    );
    _wrappedInstance.callProgress(args, handler); // 调用被包装类的方法
    debugPrint('After calling callProgress');
  }

  void debugPrint(Object? object) {
    // ignore: avoid_print
    print(object);
  }
}
