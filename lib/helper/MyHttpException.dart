class MyHttpExcepption with Exception {
  final String message;
  MyHttpExcepption(this.message);

  @override
  String toString() {
    return message;
  }
}
