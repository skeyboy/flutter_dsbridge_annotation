import 'package:flutter_dsbridge_annotation/flutter_dsbridge_annotation.dart';
import 'package:flutter_dsbridge/flutter_dsbridge.dart';

part 'js_echo_api.js.dart';

@DSBridge(enableDebug: true)
class JsEchoApi extends _$JsEchoApi {
  @dsBridge()
  dynamic syn(dynamic args) {
    return args;
  }

  @dsBridge(async: true, as: 'bb')
  void asyn(Map<String, String> args, CompletionHandler handler) {
    handler.complete(args);
  }
}
