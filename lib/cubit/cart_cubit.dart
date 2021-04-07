import 'package:awstreams/model/chair_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List purchases = [];

  List addToList(Chair chair){
    emit(CartAddItem());

    purchases.add(chair);
    return purchases;
  }
  List removeFromList(Chair chair){
    emit(CartRemoveItem());
    purchases.remove(chair);
    return purchases;
  }
}
