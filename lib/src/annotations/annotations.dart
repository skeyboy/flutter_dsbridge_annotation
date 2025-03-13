class DSBridge {
  final String? name;
  final bool? enableDebug;
  const DSBridge({this.name = "DSBridge", this.enableDebug = false});
}

// ignore: camel_case_types
class dsBridge {
  final bool? async;
  final String? as;
  const dsBridge({this.async = false, this.as});
}
