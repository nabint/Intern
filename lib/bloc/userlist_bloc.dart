import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:userlist/data/model/UserModel.dart';
import 'package:userlist/data/userRepository.dart';

part 'userlist_event.dart';
part 'userlist_state.dart';

class UserlistBloc extends Bloc<UserlistEvent, UserlistState> {
  UserRepository userRepo;
  UserlistBloc(this.userRepo);

  @override
  // TODO: implement initialState
  UserlistState get initialState => UserlistInitial();

  @override
  Stream<UserlistState> mapEventToState(
    UserlistEvent event,
  ) async* {
    if (event is FetchAllUsers) {
      yield UserlistLoading();
      try {
        List<dynamic> users = await userRepo.getAllUser();
        print("Got all Users");
        yield UserlistLoaded(users);
      } catch (e) {
        print(e);
        yield UserlistNotLoaded();
      }
    }
  }
}
