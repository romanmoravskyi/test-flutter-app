import 'package:flutter/material.dart';

class TodoView extends StatelessWidget {
  final bool _isCompleted;
  final String _title;

  TodoView(this._title, this._isCompleted);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(_title),
        trailing: Icon(
          _isCompleted ? Icons.assignment_turned_in : Icons.assignment,
          color: _isCompleted ? Colors.green : Colors.orange[300],
        ),
      ),
    );
  }
}
