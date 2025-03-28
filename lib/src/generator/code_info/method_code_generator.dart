import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:flutter_dsbridge_annotation/src/generator/code_info/code_generator.dart';
import 'package:flutter_dsbridge_annotation/src/generator/code_info/params_code_generator.dart';
import 'package:source_gen/source_gen.dart';

class MethodCodeGenerator extends CodeGenerator {
  MethodCodeGenerator(super.element, super.annotation, super.buildStep);

  @override
  void generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {}

  String get registerFunction =>
      "registerFunction(_$asMethodName,functionName:'$asMethodName');";

  MethodElement get method => originElement as MethodElement;

  String? get methodName => method.name;

  Iterable<ParamsCodeGenerator> get parameters =>
      method.parameters.map((param) {
        final paramName = param.name;
        final paramType = param.type.getDisplayString();
        return ParamsCodeGenerator(name: paramName, type: paramType);
      });

  bool get isAsync =>
      methodAnnotationObject?.getField('async')!.toBoolValue() ?? false;
  DartObject? get methodAnnotationObject =>
      method.metadata
          .firstWhere(
            (meta) =>
                meta.computeConstantValue()?.type?.getDisplayString() ==
                'dsBridge',
          )
          .computeConstantValue();
  String get returnType => method.returnType.getDisplayString();
  String get asMethodName =>
      (methodAnnotationObject?.getField('as')?.toStringValue() ?? methodName)
          ?.trim()
          .replaceAll(" ", "") ??
      "";

  @override
  String toString() {
    return '''
  @pragma('vm:entry-point')
  $returnType _$asMethodName(${parameters.join(', ')}) {
    debugPrint('Before calling $methodName with annotation: isAsync - $isAsync  as - $asMethodName');
    ${returnType == 'void' ? '' : 'final result ='} _wrappedInstance.$methodName(${method.parameters.map((p) => p.name).join(', ')}); // 调用被包装类的方法
    debugPrint('After calling $methodName');
    ${returnType == 'void' ? '' : 'return result;'}
  }
''';
  }
}
