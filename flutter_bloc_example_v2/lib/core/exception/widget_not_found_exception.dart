class WidgetNotFoundException<T> implements Exception {
  @override
  String toString() {
    return "Class doesnt have this state: $T";
  }
}
