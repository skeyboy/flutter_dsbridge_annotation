class ParamsCodeGenerator {
  String? name;
  String? type;
  ParamsCodeGenerator({this.name, this.type});
  @override
  String toString() {
    if (name == null || type == null) {
      return '';
    } else {
      return '$type $name';
    }
  }
}
