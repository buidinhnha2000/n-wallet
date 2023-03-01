import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {}

class User extends Equatable {
  final String id;

  const User(this.id);

  @override
  List<Object?> get props => [id];

  static const empty = User('-');
}
