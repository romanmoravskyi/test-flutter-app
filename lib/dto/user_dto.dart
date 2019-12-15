import 'base_dto.dart';

class UserDTO extends BaseDTO {
  int _id;
  String _name;
  String _email;

  @override
  int get id => _id;

  String get name => _name;

  String get email => _email;

  UserDTO(this._id, this._name, this._email);

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      json['id'],
      json['name'],
      json['email'],
    );
  }
}
