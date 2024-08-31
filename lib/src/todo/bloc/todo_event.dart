abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String newTask;

  AddTodoEvent({required this.newTask});
}

class GetTodoEvent extends TodoEvent {}

class EditTodoEvent extends TodoEvent {
  final int currentIndex;

  EditTodoEvent({required this.currentIndex});
}

class DeleteTodoEvent extends TodoEvent {
  final int currentIndex;

  DeleteTodoEvent({required this.currentIndex});
}
