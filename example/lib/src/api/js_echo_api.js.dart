// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'js_echo_api.dart';

// **************************************************************************
// DSBridgeGenerator
// **************************************************************************

// Generated _$JsEchoApi class for JsEchoApi
class _$JsEchoApi extends JavaScriptNamespaceInterface {
  late final JsEchoApi _wrappedInstance = JsEchoApi();
  JsEchoApi get jsechoapi => _wrappedInstance;

  @override
  void register() {
    registerFunction(_syn, functionName: 'syn');
    registerFunction(_bb, functionName: 'bb');
  }

  @pragma('vm:entry-point')
  dynamic _syn(dynamic args) {
    debugPrint('Before calling syn with annotation: isAsync - false  as - syn');
    final result = _wrappedInstance.syn(args); // 调用被包装类的方法
    debugPrint('After calling syn');
    return result;
  }

  @pragma('vm:entry-point')
  void _bb(Map<String, String> args, CompletionHandler handler) {
    debugPrint('Before calling asyn with annotation: isAsync - true  as - bb');
    _wrappedInstance.asyn(args, handler); // 调用被包装类的方法
    debugPrint('After calling asyn');
  }

  void debugPrint(Object? object) {
    // ignore: avoid_print
    print(object);
  }
}
