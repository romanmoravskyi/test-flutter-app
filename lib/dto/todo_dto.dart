import 'base_dto.dart';

class TodoDTO extends BaseDTO {
  int _id;
  String _title;
  bool _completed;

  @override
  int get id => _id;

  String get title => _title;

  bool get completed => _completed;

  TodoDTO(this._id, this._title, this._completed);

  factory TodoDTO.fromJson(Map<String, dynamic> json) {
    return TodoDTO(
      json['id'],
      json['title'],
      json['completed'],
    );
  }
}
