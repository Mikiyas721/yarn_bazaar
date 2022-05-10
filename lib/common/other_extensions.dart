extension ListExtension on List{
  change<T>(int index,T value){
    this[index] = value;
    return this;
  }
}