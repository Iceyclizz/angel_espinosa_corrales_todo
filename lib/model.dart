class Modelo {
  factory Modelo() {
    return _instance;
  }

  Modelo._constructor();
  final List<String> _todoList = <String>[];
  static final Modelo _instance = Modelo._constructor();

  List<String> get todoList => _todoList;
}
