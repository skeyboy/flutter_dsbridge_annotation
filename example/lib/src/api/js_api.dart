import 'dart:async';
import 'package:flutter_dsbridge/flutter_dsbridge.dart';
import 'package:flutter_dsbridge_annotation/flutter_dsbridge_annotation.dart';

part 'js_api.js.dart';

@DSBridge(enableDebug: true)
class JsApi extends _$JsApi {
  @dsBridge()
  String testSyn(dynamic msg) {
    print('msg=$msg');
    return "$msg［syn call］";
  }

  @dsBridge(async: true)
  void testAsyn(dynamic msg, CompletionHandler handler) {
    handler.complete("$msg [ asyn call]");
  }

  @dsBridge()
  String testNoArgSyn(dynamic arg) {
    return "testNoArgSyn called [ syn call]";
  }

  @dsBridge(async: true)
  void testNoArgAsyn(dynamic arg, CompletionHandler handler) {
    handler.complete("testNoArgAsyn called [ asyn call]");
  }

  @dsBridge(async: true)
  void callProgress(String args, CompletionHandler handler) {
    var i = 10;
    final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (i == 0) {
        timer.cancel();
        handler.complete(0);
      } else {
        handler.setProgressData(i--);
      }
    });
  }
}
