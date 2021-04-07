import 'package:awstreams/cubit/cart_cubit.dart';
import 'package:awstreams/model/chair_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {

  group('cartCubit', () {
    CartCubit cartCubit;
    Chair chair;
    setUp(() {
      cartCubit = CartCubit();
      chair = Chair(color: "ss",
          height: 2,
          backgorundColor: Colors.grey,
          description: "ass",
        imageUrl: "ass",
        name: "ss",
        price: 5,
        rating: 2.3,
        type: "ss",
        weight: 5
      );
    });

    tearDown(() {
      cartCubit.close();
    });

    test('initial state of userCubit is userState()', () {
      expect(cartCubit.state, CartInitial());
    });


    blocTest(
      'the cartCubit should emit a CartAddItem when the addToList function is called',
      build: () => cartCubit,
      act: (cubit) => cartCubit.addToList(chair),
      expect: () => [CartAddItem(),],
    );
    blocTest(
      'the cartCubit should emit a CartRemoveItem when the removeFromList function is called',
      build: () => cartCubit,
      act: (cubit) => cartCubit.removeFromList(chair),
      expect: () => [CartRemoveItem()],
    );

  });
}