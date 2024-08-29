import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo/core/constats.dart';

part 'new_task_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  NewTaskCubit() : super(NewTaskInitial());
    insertIntoDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO task(title, date, time, status) VALUES ("$title", "$date", "$time", "New")')
          .then((value) {
        debugPrint('$value is inserted...');
        emit(DatabaseInsertState());
      }).catchError((error) {
        debugPrint('Error happened while inserting: ${error.toString()}');
      });
    });
  }
}
