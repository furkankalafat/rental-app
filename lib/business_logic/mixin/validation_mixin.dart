mixin ValidationMixin {
  String? emptyValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    }
    return '';
  }
}
