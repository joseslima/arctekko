import 'package:arctekko/domain/todo/models/todo.model.dart';
import 'package:arctekko/domain/todo/todo.domain.service.dart';
import 'package:arctekko/infrastructure/dal/dao/todo.dao.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class HomeStore extends RxController {
  TodoDomainService _todoDomainService;
  HomeStore(
    this._todoDomainService, {
    Map<String, dynamic> screenArgs,
  });

  @override
  void onInit() async {
    await fetchTodoList();

    TodoDao(
      id: Uuid().v4(),
      desc: 'Funcionando opk',
      title: 'titleeeae',
    ).save();

    var list = TodoDao().select();
    for (var l in list) {
      print(l.toMap());
    }
  }

  Future<void> fetchTodoList() async {
    try {
      var tl = await _todoDomainService.fetchTodoList();
      todoList.assignAll(tl);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> addTodo(TodoModel todo) async {
    try {
      await _todoDomainService.addTodo(todo);
      todoList.add(todo);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> removeTodo(TodoModel todo) async {
    try {
      await _todoDomainService.removeTodo(todo);
      todoList.remove(todo);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> editeTodo(TodoModel todo) async {
    try {
      await _todoDomainService.editTodo(todo);
      var todoInList = todoList.firstWhere((t) => t.id == todo.id);
      var indexOfTodo = todoList.value.indexOf(todoInList);
      todoList[indexOfTodo] = todo;
    } catch (err) {
      rethrow;
    }
  }

  final todoList = <TodoModel>[].obs;
}
