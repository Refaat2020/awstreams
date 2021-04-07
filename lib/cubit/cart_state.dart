part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}
class CartRemoveItem extends CartState {
  @override
  List<Object> get props => [];
}
class CartAddItem extends CartState {
  @override
  List<Object> get props => [];
}
class CartEmpty extends CartState {
  @override
  List<Object> get props => [];
}
