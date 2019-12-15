import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  final String _email;
  final String _name;

  UserView(this._name, this._email);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.person,
                color: Colors.orange,
              ),
              Text(
                _name,
                style: TextStyle(color: Colors.black87),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.email, color: Colors.grey),
              Text(
                _email,
                style: TextStyle(color: Colors.black87),
              )
            ],
          )
        ],
      ),
    );
  }
}
