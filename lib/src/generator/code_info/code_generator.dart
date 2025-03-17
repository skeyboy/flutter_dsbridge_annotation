import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

abstract class CodeGenerator {
  Element originElement;
  ConstantReader annotation;
  BuildStep buildStep;

  late String code;
  CodeGenerator(Element element, this.annotation, this.buildStep)
    : originElement = element {
    generateForAnnotatedElement(element, annotation, buildStep);
  }

  void generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {}
}
