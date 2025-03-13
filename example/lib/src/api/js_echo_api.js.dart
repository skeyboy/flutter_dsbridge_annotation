// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'js_echo_api.dart';

// **************************************************************************
// DSBridgeGenerator
// **************************************************************************

// Generated wrapper class for JsEchoApi

class JsEchoApiWrapper extends JavaScriptNamespaceInterface {
  late final JsEchoApi _wrappedInstance = JsEchoApi();
  JsEchoApi get jsechoapi => _wrappedInstance;

  @override
  void register() {
    registerFunction(syn, functionName: 'syn');
    registerFunction(asyn, functionName: 'asyn');
  }

  @pragma('vm:entry-point')
  dynamic syn(dynamic args) {
    debugPrint('Before calling syn with annotation: isAsync - false  as - syn');
    final result = _wrappedInstance.syn(args); // 调用被包装类的方法
    debugPrint('After calling syn');
    return result;
  }

  @pragma('vm:entry-point')
  void asyn(dynamic args, CompletionHandler handler) {
    debugPrint(
      'Before calling asyn with annotation: isAsync - true  as - asyn',
    );
    _wrappedInstance.asyn(args, handler); // 调用被包装类的方法
    debugPrint('After calling asyn');
  }

  void debugPrint(Object? object) {
    print(object);
  }
}
