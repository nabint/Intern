part of 'userlist_bloc.dart';

@immutable
abstract class UserlistEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchAllUsers extends UserlistEvent {}
