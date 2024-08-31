import 'dart:async';

import 'package:blocmodules/src/todo/bloc/todo_event.dart';
import 'package:blocmodules/src/todo/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, ToDoState> {
  TodoBloc()
      : super(ToDoState(todoList: [
          "Apple",
          "Mango",
          "Banana",
          "Gava",
          "Grapes",
          "Orange",
          "Pineapple"
        ])) {
    on<AddTodoEvent>(addItem);
    on<GetTodoEvent>(getItem);
    on<EditTodoEvent>(editItem);
    on<DeleteTodoEvent>(deleteItem);
  }

// ADD ITEM
  FutureOr<dynamic> addItem(AddTodoEvent event, Emitter<ToDoState> emit) {
    state.todoList.add(event.newTask);
    emit(ToDoState(todoList: List.from(state.todoList)));
  }

  // GET ITEM
  FutureOr<void> getItem(GetTodoEvent event, Emitter<ToDoState> emit) {
    emit(ToDoState(todoList: state.todoList));
  }

// EDIT ITEM
  FutureOr<void> editItem(EditTodoEvent event, Emitter<ToDoState> emit) {
    emit(ToDoState(todoList: state.todoList));
  }

  // DELETE ITEM
  FutureOr<void> deleteItem(DeleteTodoEvent event, Emitter<ToDoState> emit) {
    try {
      state.todoList.removeAt(event.currentIndex);
      emit(ToDoState(todoList: state.todoList));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
