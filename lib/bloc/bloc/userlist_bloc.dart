import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'userlist_event.dart';
part 'userlist_state.dart';

class UserlistBloc extends Bloc<UserlistEvent, UserlistState> {
  UserlistBloc() : super(UserlistInitial());

  @override
  Stream<UserlistState> mapEventToState(
    UserlistEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
