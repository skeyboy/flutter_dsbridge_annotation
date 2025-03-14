import 'package:flutter_dsbridge_annotation/flutter_dsbridge_annotation.dart';
import 'package:flutter_dsbridge_annotation/src/generator/code_info/class_code_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

class DSBridgeGenerator extends GeneratorForAnnotation<DSBridge> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is ClassElement) {
      final codeGenerator = ClassCodeGenerator(element, annotation, buildStep);
      return codeGenerator.toString();
    }
    return '';
  }
}
