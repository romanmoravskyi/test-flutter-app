import 'package:flutter/material.dart';
import 'package:test_flutter_app/dto/todo_dto.dart';
import 'package:test_flutter_app/services/crud_service.dart';
import 'package:test_flutter_app/views/todo_view.dart';

class TodosScreen extends StatefulWidget {
  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  var _crudService = CrudService<TodoDTO>(
      'https://jsonplaceholder.typicode.com',
      'todos',
      (u) => TodoDTO.fromJson(u));

  Future<List<TodoDTO>> _todos;

  @override
  void initState() {
    super.initState();
    _todos = _crudService.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<TodoDTO>>(
          future: _todos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TodoView(
                          snapshot.data[i].title, snapshot.data[i].completed),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return CircularProgressIndicator();
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Add Todo',
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.black87,
      //   mini: true,
      // ),
    );
  }
}
