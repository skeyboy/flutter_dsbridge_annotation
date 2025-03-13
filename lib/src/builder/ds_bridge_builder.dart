import 'package:build/build.dart';
import 'package:flutter_dsbridge_annotation/src/generator/ds_bridge_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder dsBridgeBuilder(BuilderOptions options) =>
    PartBuilder([DSBridgeGenerator()], '.js.dart');
