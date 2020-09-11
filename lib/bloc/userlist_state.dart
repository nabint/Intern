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

  List<User> get getUser => _users;

  @override
  // TODO: implement props
  List<Object> get props => [_users];
}

class UserlistNotLoaded extends UserlistState {}

class UserDetailLoaded extends UserlistState {
  final _user;
  UserDetailLoaded(this._user);
  User get getUserDetail => _user;

  @override
  // TODO: implement props
  List<Object> get props => [_user];
}

class UserPostsLoading extends UserlistState {}

class UserPostsLoaded extends UserlistState {
  final _userPosts;
  UserPostsLoaded(this._userPosts);
  List<Userpost> get getUserPosts => _userPosts;

  @override
  List<Object> get props => [_userPosts];
}

class UserCommentsLoading extends UserlistState {}

class UserCommentsLoaded extends UserlistState {
  final _userComments;
  UserCommentsLoaded(this._userComments);
  List<UserComment> get getUserComments => _userComments;

  @override
  List<Object> get props => [_userComments];
}
