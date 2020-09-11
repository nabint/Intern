part of 'userlist_bloc.dart';

@immutable
abstract class UserlistEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchAllUsers extends UserlistEvent {}

class FetchUserDetail extends UserlistEvent {
  final User user;
  FetchUserDetail({this.user});
}

class FetchUserPosts extends UserlistEvent {
  final id;
  FetchUserPosts(this.id);
}
