class ToDoState {
  final List<String> todoList;

  ToDoState({required this.todoList});
  ToDoState copyWith({List<String>? todoList}) =>
      ToDoState(todoList: todoList ?? this.todoList);
}
