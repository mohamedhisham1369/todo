import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/core/constats.dart';
import 'package:todo/features/main%20layout/bloc/main_states.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitState());

  List<Map> todoData = [];
  List<Map> doneData = [];
  List<Map> archivedData = [];

  int currentIndex = 0;

  List<String> titles = ['Todo', 'Archived', 'Done'];

  void createDatabase() async {
    emit(DatabaseCreateLoadingState());
    database = await openDatabase('todo.db', version: 1,
        onCreate: (database, version) async {
      debugPrint('Database is created...');
      await database
          .execute(
              'CREATE TABLE task (id INTEGER PRIMARY KEY, title TEXT, date TEXT,'
              'time TEXT, status TEXT)')
          .then((value) {
        debugPrint('Table is created...');
      });
    }).then((value) {
      emit(DatabaseCreateState());
      return value;
    });
  }

  static MainCubit get(BuildContext context) => BlocProvider.of(context);

  void changeIndex(int id) {
    currentIndex = id;
    emit(ChangeIndexState());
  }
}
