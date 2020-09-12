part of 'userlist_bloc.dart';

@immutable
abstract class UserlistState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserlistInitial extends UserlistState {}

class UserlistLoaded extends UserlistState {
  final _users;
  UserlistLoaded(this._users);

  List<User> get getUser => _users;

  @override
  // TODO: implement props
  List<Object> get props => [_users];
}

class UserDetailLoaded extends UserlistState {
  final _user;
  UserDetailLoaded(this._user);
  User get getUserDetail => _user;

  @override
  // TODO: implement props
  List<Object> get props => [_user];
}

class UserPostsLoaded extends UserlistState {
  final _userPosts;
  UserPostsLoaded(this._userPosts);
  List<Userpost> get getUserPosts => _userPosts;

  @override
  List<Object> get props => [_userPosts];
}

class UserCommentsLoaded extends UserlistState {
  final _userComments;
  String userid;
  UserCommentsLoaded(this._userComments, {this.userid});
  List<UserComment> get getUserComments => _userComments;

  @override
  List<Object> get props => [_userComments];
}

class Loading extends UserlistState {}
