part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}
class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}
class UserFetched extends UserState {
  final  userData;

  UserFetched({this.userData});

  @override
  List<Object> get props => [];
}
class UserField extends UserState {
 final String error;

 UserField({this.error});

  @override
  List<Object> get props => [];
}
