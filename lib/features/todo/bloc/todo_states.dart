abstract class TodoState {}

class TodoInitState extends TodoState{}
class TodoGetLoadingState extends TodoState{}

class TodoDatabaseGetState extends TodoState{}

class TodoDatabaseDeleteState extends TodoState{}

class TodoDatabaseUpdateState extends TodoState{}

class DatabaseCreateState extends TodoState{}