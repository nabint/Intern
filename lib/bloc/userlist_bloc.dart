import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:userlist/data/model/UserComments.dart';
import 'package:userlist/data/model/UserModel.dart';
import 'package:userlist/data/model/UserPosts.dart';
import 'package:userlist/data/userRepository.dart';

part 'userlist_event.dart';
part 'userlist_state.dart';

class UserlistBloc extends Bloc<UserlistEvent, UserlistState> {
  UserRepository userRepo;
  UserlistBloc(this.userRepo);

  @override
  UserlistState get initialState => UserlistInitial();

  @override
  Stream<UserlistState> mapEventToState(
    UserlistEvent event,
  ) async* {
    if (event is FetchAllUsers) {
      yield (Loading());
      try {
        List<User> users = await userRepo.getAllUser();
        print("Got all Users");
        yield UserlistLoaded(users);
      } catch (e) {
        print(e);
      }
    } else if (event is FetchUserDetail) {
      yield UserDetailLoaded(event.user);
    } else if (event is FetchUserPosts) {
      yield (Loading());
      try {
        List<Userpost> userPosts = await userRepo.getUserPost(event.id);
        print("UserPost loaded");
        yield UserPostsLoaded(userPosts);
      } catch (e) {
        print(e);
      }
    } else if (event is FetchUserComments) {
      try {
        List<UserComment> userComments =
            await userRepo.getUserComments(event.postid);
        yield UserCommentsLoaded(userComments);
      } catch (e) {
        print(e);
      }
    }
  }
}
