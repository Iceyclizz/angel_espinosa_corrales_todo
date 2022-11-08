import 'package:angel_espinosa_corrales_todo/model.dart';

class ToDoController {
  List<String> get todoList => Modelo().todoList;

  void addList(String title) {
    Modelo().todoList.add(title);
  }
}
