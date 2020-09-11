part of 'userlist_bloc.dart';

@immutable
abstract class UserlistState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserlistInitial extends UserlistState {}

class UserlistLoading extends UserlistState {}

class UserlistLoaded extends UserlistState {
  final _users;
  UserlistLoaded(this._users);

  List<Users> get getUsers => _users;

  @override
  // TODO: implement props
  List<Object> get props => [_users];
}

class UserlistNotLoaded extends UserlistState {}
