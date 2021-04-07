import 'package:awstreams/cubit/user_cubit.dart';
import 'package:awstreams/repo/user_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {

  group('userCubit', () {
    UserCubit userCubit;
    UserRepository userRepository;

    setUp(() {
        userRepository = UserRepository();
        userCubit = UserCubit(userRepository);
    });

    tearDown(() {
      userCubit.close();
    });

    test('initial state of userCubit is userState()', () {
      expect(userCubit.state, UserInitial());
    });


    blocTest(
        'the userCubit should emit a userLoading when the getUserData function is called',
        build: () => userCubit,
        act: (cubit) => userCubit.getUserData(),
      expect: () => [UserLoading(),UserFetched()],
    );

  });
}