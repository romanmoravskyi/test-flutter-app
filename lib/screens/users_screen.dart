import 'package:flutter/material.dart';
import 'package:test_flutter_app/dto/user_dto.dart';
import 'package:test_flutter_app/services/crud_service.dart';
import 'package:test_flutter_app/views/user_view.dart';

class UsersScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<UsersScreen> {
  var _crudService = CrudService<UserDTO>(
      'https://jsonplaceholder.typicode.com',
      'users',
      (u) => UserDTO.fromJson(u));

  Future<List<UserDTO>> _users;

  CircleAvatar _buildAvatar(String name) {
    String queryNameParam = name.split(' ').first;

    if (name == null || name.isEmpty) {
      queryNameParam = "Random";
    }

    return CircleAvatar(
      backgroundImage: NetworkImage(
          "https://api.adorable.io/avatars/144/$queryNameParam@adorable.io.png"),
    );
  }

  @override
  void initState() {
    super.initState();
    _users = _crudService.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<UserDTO>>(
        future: _users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildAvatar(snapshot.data[i].name),
                        SizedBox(
                          width: 10.0,
                        ),
                        UserView(snapshot.data[i].name, snapshot.data[i].email),
                      ],
                    ),
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
    );
  }
}
