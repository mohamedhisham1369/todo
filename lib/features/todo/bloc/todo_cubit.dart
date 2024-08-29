import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constats.dart';
import 'package:todo/features/todo/bloc/todo_states.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitState());
  List<Map> todoData = [];

  static TodoCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> updateInTodo({required String status, required int id}) async {
    await database
        .rawUpdate('UPDATE task SET status = "$status" WHERE id = $id')
        .then((value) async {
      emit(TodoDatabaseUpdateState());
      await getTodoTasks();
    }).catchError((error) {
      debugPrint('Error happened while updating record: ${error.toString()}');
    });
  }

  Future<void> getTodoTasks() async {
    emit(TodoGetLoadingState());
    await database
        .rawQuery('SELECT * FROM task WHERE status = "New"')
        .then((value) {
      todoData = value;
      emit(TodoDatabaseGetState());
    }).catchError((error) {
      debugPrint('Error happened while getting data: ${error.toString()}');
    });
  }

  Future<void> deleteFromTodo(int id) async {
    await database
        .rawDelete('DELETE FROM task WHERE id = $id')
        .then((value) async {
      emit(TodoDatabaseDeleteState());
      await getTodoTasks();
    }).catchError((error) {
      debugPrint('Error happened while deleting record: ${error.toString()}');
    });
  }
}
