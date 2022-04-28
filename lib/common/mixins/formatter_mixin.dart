mixin FormatterMixin {
  String getInitials(String value) {
    final split = value.split(' ');
    if (split.length == 1) {
      return split[0][0].toUpperCase();
    } else {
      return '${split[0][0].toUpperCase()}${split[1][0].toUpperCase()}';
    }
  }
}
