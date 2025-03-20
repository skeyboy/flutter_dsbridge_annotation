import 'package:flutter_dsbridge_annotation/flutter_dsbridge_annotation.dart';

part 'js_echo_api.js.dart';

@DSBridge(enableDebug: true)
class JsEchoApi extends _$JsEchoApi {
  @dsBridge()
  dynamic syn(dynamic args) {
    return args;
  }

  @dsBridge(async: true)
  void asyn(dynamic args, CompletionHandler handler) {
    handler.complete(args);
  }
}
