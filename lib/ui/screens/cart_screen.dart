import 'package:awstreams/constant/custom_icons_icons.dart';
import 'package:awstreams/cubit/cart_cubit.dart';
import 'package:awstreams/ui/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// *****  Cart screen *******

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          iconSize: 30.0,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Your Cart',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(CustomIcons.short_text),
            onPressed: () {},
            color: Colors.black,
            iconSize: 30.0,
          )
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        bloc: CartCubit(),
         buildWhen: (previous, current) => current is CartRemoveItem,
        builder: (context, state) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CartItem(index: index);

            },
            itemCount:context.watch<CartCubit>().purchases.length,
          );
        },
      ),
      ///for total
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, -1), blurRadius: 20.0)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Cost',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '535',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Cost',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '\$20',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Cost',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '2000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Container(
                height: 70.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, 2.0),
                        blurRadius: 30.0,
                      )
                    ]),
                child: Center(
                  child: Text(
                    'Check Out',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
