import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constats.dart';
import 'package:todo/core/utilies/easy_loading.dart';

import 'done_states.dart';

class DoneCubit extends Cubit<DoneState> {
  DoneCubit() : super(DoneInitState());
  List<Map> doneData = [];

  static DoneCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> updateInDone({required String status, required int id}) async {
    await database
        .rawUpdate('UPDATE task SET status = "$status" WHERE id = $id')
        .then((value) async {
      emit(DoneDatabaseUpdateState());
      await getDoneTasks();
    }).catchError((error) {
      debugPrint('Error happened while updating record: ${error.toString()}');
    });
  }

  Future<void> getDoneTasks() async {
          emit(DoneDatabaseLoadingState());

    await database
        .rawQuery('SELECT * FROM task WHERE status = "Done"')
        .then((value) {
      doneData = value;
      emit(DoneDatabaseGetState());
    }).catchError((error) {
      debugPrint('Error happened while getting data: ${error.toString()}');
    });
  }

  Future<void> deleteFromDone(int id) async {
    showLoading();
    await database
        .rawDelete('DELETE FROM task WHERE id = $id')
        .then((value) async {
      emit(DoneDatabaseDeleteState());
      await getDoneTasks();
      hideLoading();
    }).catchError((error) {
      hideLoading();

      debugPrint('Error happened while deleting record: ${error.toString()}');
    });
  }
}
