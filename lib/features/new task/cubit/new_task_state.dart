part of 'new_task_cubit.dart';

@immutable
sealed class NewTaskState {}

final class NewTaskInitial extends NewTaskState {}

final class DatabaseInsertState extends NewTaskState {}
