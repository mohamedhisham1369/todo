import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constats.dart';
import 'package:todo/features/archived/bloc/archived_states.dart';

class ArchivedCubit extends Cubit<ArchivedState> {
  ArchivedCubit() : super(ArchivedInitState());
  List<Map> archivedData = [];

  static ArchivedCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> updateInArchived(
      {required String status, required int id}) async {
    await database
        .rawUpdate('UPDATE task SET status = "$status" WHERE id = $id')
        .then((value) async {
      emit(ArchivedDatabaseUpdateState());
      await getArchivedTasks();
    }).catchError((error) {
      debugPrint('Error happened while updating record: ${error.toString()}');
    });
  }

  Future<void> getArchivedTasks() async {
    emit(ArchivedGetLoadingState());
    await database
        .rawQuery('SELECT * FROM task WHERE status = "Archived"')
        .then((value) {
      archivedData = value;
      emit(ArchivedDatabaseGetState());
    }).catchError((error) {
      debugPrint('Error happened while getting data: ${error.toString()}');
    });
  }

  Future<void> deleteFromArchived(int id) async {
    await database
        .rawDelete('DELETE FROM task WHERE id = $id')
        .then((value) async {
      emit(ArchivedDatabaseDeleteState());
      await getArchivedTasks();
    }).catchError((error) {
      debugPrint('Error happened while deleting record: ${error.toString()}');
    });
  }
}
