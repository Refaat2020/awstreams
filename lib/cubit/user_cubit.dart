import 'package:awstreams/model/user_model.dart';
import 'package:awstreams/repo/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._userRepository) : super(UserInitial());
  final UserRepository _userRepository;
UserModel userdata;
  Future getUserData()async{

    emit(UserLoading());
    try {
      userdata = await _userRepository.getUser();
      if (userdata ==null) {
        emit(UserField(error: "There an error"));
      } else{
        emit(UserFetched(userData: userdata));
      }
    } on Exception catch (e) {
      emit(UserField(error: e.toString()));
    }
  }
}
