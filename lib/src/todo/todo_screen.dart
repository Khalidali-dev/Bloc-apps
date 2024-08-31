import 'package:blocmodules/src/todo/bloc/todo_bloc.dart';
import 'package:blocmodules/src/todo/bloc/todo_event.dart';
import 'package:blocmodules/src/todo/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDO App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () =>
              context.read<TodoBloc>().add(AddTodoEvent(newTask: "Mango"))),
      body: Center(
        child: BlocBuilder<TodoBloc, ToDoState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                var todoList = state.todoList[index];
                return ListTile(
                  title: Text(todoList),
                  trailing: IconButton(
                      onPressed: () => context
                          .read<TodoBloc>()
                          .add(DeleteTodoEvent(currentIndex: index)),
                      icon: const Icon(Icons.delete)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
