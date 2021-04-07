import 'package:awstreams/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CartItem extends StatelessWidget {
  int index;

  CartItem({this.index});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      child: Container(
        height: 100.0,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 20.0,
              )
            ]),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///chair background color
                Container(
                  margin: EdgeInsets.all(5.0),
                  width: 100.0,
                  height: 94.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                    color: cart.purchases[index].backgorundColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Image(
                      height: 200.0,
                      width: 200.0,
                      image: AssetImage(cart.purchases[index].imageUrl),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///chair name
                    Container(
                      width: 140.0,
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.0, top: 15.0),
                        child: Text(
                          cart.purchases[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Column(
                          children: [
                            ///chair color
                            Container(
                              width: 140.0,
                              child: Padding(
                                padding: EdgeInsets.only(left: 4.0),
                                child: Text(
                                  cart.purchases[index].color,
                                  style: TextStyle(
                                      color: Colors.black26, fontSize: 13.0),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            ///chair type
                            Container(
                              width: 140.0,
                              child: Padding(
                                padding: EdgeInsets.only(left: 4.0),
                                child: Text(
                                  cart.purchases[index].type,
                                  style: TextStyle(
                                    color: Colors.black26,
                                    fontSize: 12.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                ///remove chair

                                cart.removeFromList(cart.purchases[index]);
                                // setState(() {});
                              },
                              child: Container(
                                height: 20.0,
                                width: 20.0,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade500,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Center(
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                    size: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: 140.0,
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text(
                          '\$' + cart.purchases[index].price.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
