mixin FormatterMixin {
  String getInitials(String? value) {
    if(value==null) return '';
    final split = value.split(' ');
    if (split.length == 1) {
      return split[0][0].toUpperCase();
    } else {
      return '${split[0][0].toUpperCase()}${split[1][0].toUpperCase()}';
    }
  }

  String listHorizontally(List<String> items){
    String formatted = "";
    for(int i=0;i<items.length;i++){
      if(i==0) formatted+=items[i];
      else formatted+=', ${items[i]}';
    }
    return formatted;
  }
}
