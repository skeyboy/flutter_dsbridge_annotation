import 'package:flutter_dsbridge_annotation/flutter_dsbridge_annotation.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

class DSBridgeGenerator extends GeneratorForAnnotation<DSBridge> {
  late bool enableDebug = false;
  late String print = "";
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is ClassElement) {
      // 获取类名和注解值
      final className = element.name;
      final annotationValue =
          annotation.peek('name')?.stringValue ?? "DSBridge";
      enableDebug = annotation.peek('enableDebug')?.boolValue ?? false;
      // 打印日志
      if (enableDebug) {
        print = '''
      print(object);
''';
      }
      final registerFunctions = List.empty(growable: true);
      // 查找类中被 @dsBridge 标记的方法
      final methods = element.methods
          .where(
            (method) => method.metadata.any(
              (meta) =>
                  meta.computeConstantValue()?.type?.getDisplayString() ==
                  'dsBridge',
            ),
          )
          .map((method) {
            String methodName = method.name;
            final methodAnnotationObject =
                method.metadata
                    .firstWhere(
                      (meta) =>
                          meta
                              .computeConstantValue()
                              ?.type
                              ?.getDisplayString() ==
                          'dsBridge',
                    )
                    .computeConstantValue();
            final isAsync =
                methodAnnotationObject?.getField('async')!.toBoolValue();

            final asMethodName = (methodAnnotationObject
                        ?.getField('as')
                        ?.toStringValue() ??
                    methodName)
                .trim()
                .replaceAll(" ", "");

            registerFunctions.add(
              "registerFunction($asMethodName,functionName:'$asMethodName');",
            );

            final override = (asMethodName == methodName) ? "@override" : "";

            // 获取方法的参数列表
            final parameters = method.parameters
                .map((param) {
                  final paramName = param.name;
                  final paramType = param.type.getDisplayString();

                  return '$paramType $paramName';
                })
                .join(', ');

            // 获取方法的返回类型
            final returnType = method.returnType.getDisplayString();
            // 生成调用 _wrappedInstance 方法的代码
            return '''
  @pragma('vm:entry-point')
  $returnType $asMethodName($parameters) {
    debugPrint('Before calling $methodName with annotation: isAsync - $isAsync  as - $asMethodName');
    ${returnType == 'void' ? '' : 'final result ='} _wrappedInstance.$methodName(${method.parameters.map((p) => p.name).join(', ')}); // 调用被包装类的方法
    debugPrint('After calling $methodName');
    ${returnType == 'void' ? '' : 'return result;'}
  }
''';
          })
          .join('\n');

      // 生成包装类的代码
      return '''

// Generated wrapper class for $className

class ${className}Wrapper extends JavaScriptNamespaceInterface {
  late final $className _wrappedInstance = $className();
  $className get ${className.toLowerCase()} => _wrappedInstance;

   @override
  void register() { ${registerFunctions.join("\n")} }

$methods

 void debugPrint(Object? object) {
    $print
  }
}
''';
    }

    return '';
  }
}
