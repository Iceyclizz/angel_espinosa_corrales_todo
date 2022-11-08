class modelo{

  factory modelo(){
    return _instance;
  }
  modelo._constructor(){}
  List<String> _todoList= <String>[];
  static final modelo _instance= modelo._constructor();

  List<String> get todoList => _todoList;
}