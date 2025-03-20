import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:flutter_dsbridge_annotation/src/generator/code_info/code_generator.dart';
import 'package:flutter_dsbridge_annotation/src/generator/code_info/method_code_generator.dart';
import 'package:source_gen/source_gen.dart';

class ClassCodeGenerator extends CodeGenerator {
  ClassCodeGenerator(super.element, super.annotation, super.buildStep);
  ClassElement? get element => originElement as ClassElement;

  late List<MethodCodeGenerator> methodsInfo = List.empty(growable: true);

  String get className => element?.name ?? "";
  bool get enableDebug => annotation.peek('enableDebug')?.boolValue ?? false;

  String logPrint() {
    if (enableDebug) {
      return '''
      // ignore: avoid_print
      print(object);
''';
    } else {
      return "";
    }
  }

  String get printFunction => logPrint();

  @override
  void generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      return;
    }

    // 查找类中被 @dsBridge 标记的方法
    methodsInfo = element.methods
        .where(
          (method) => method.metadata.any(
            (meta) =>
                meta.computeConstantValue()?.type?.getDisplayString() ==
                'dsBridge',
          ),
        )
        .map((method) {
          return MethodCodeGenerator(method, annotation, buildStep);
        })
        .toList(growable: true);
  }

  @override
  String toString() {
    return '''
// Generated _\$${className} class for $className
class _\$${className} extends JavaScriptNamespaceInterface {
  late final $className _wrappedInstance = $className();
  $className get ${className.toLowerCase()} => _wrappedInstance;

   @override
  void register() { ${methodsInfo.map((it) => it.registerFunction).join("\n")} }

${methodsInfo.map((it) => it.toString()).join("\n")}

 void debugPrint(Object? object) {
    $printFunction
  }

}
''';
  }
}
