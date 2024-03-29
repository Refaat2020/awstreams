import 'package:awstreams/cubit/cart_cubit.dart';
import 'package:awstreams/model/chair_model.dart';
import 'package:awstreams/ui/screens/user_screen.dart';
import 'package:awstreams/ui/widgets/product_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_screen.dart';

/// *****  product screen *******
class DetailsScreen extends StatefulWidget {
  final Chair chair;

  const DetailsScreen({Key key, this.chair}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool pressed = false;
  bool bought = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ///for image
                  Container(
                    height: MediaQuery.of(context).size.height/2.88,
                    width: double.infinity,
                    color: widget.chair.backgorundColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Image(
                        image: AssetImage(widget.chair.imageUrl),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  ///for icons
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          iconSize: 30.0,
                          onPressed: () => Navigator.pop(context),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon( FontAwesomeIcons.user,
                              size: 30.0,
                              ),
                              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen(),)),
                            ),
                            IconButton(
                              icon: Icon(Icons.shopping_bag_outlined),
                              iconSize: 30.0,
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CartScreen(),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              ///for chair name
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child: Text(
                  widget.chair.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    letterSpacing: 1.8,
                  ),
                ),
              ),
              ///for chair type
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                ),
                child: Text(
                  widget.chair.type,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              ///rating
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    widget.chair.rating.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Details',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              ///for chair description
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 10.0),
                child: Text(
                  widget.chair.description,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black38,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProductButtonWidget(text:'H: ' + widget.chair.height.toString() + '"' ,),
                  ProductButtonWidget(text:'W: ' + widget.chair.weight.toString() + ' lbs' ,),
                  ProductButtonWidget(text: widget.chair.color ,),

                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ///for buy now and like button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bought = true;
                      });
                      context.read<CartCubit>().addToList(widget.chair);
                      showToast('${widget.chair.name} successfully Added to your cart',
                        context: context,
                        animation: StyledToastAnimation.scale,
                        reverseAnimation: StyledToastAnimation.slideToTopFade,
                        position: StyledToastPosition.center,
                        animDuration: Duration(seconds: 2),
                        duration: Duration(seconds: 4),
                        curve: Curves.easeInCubic,
                        reverseCurve: Curves.linear,
                        isIgnoring: true,
                        backgroundColor: Colors.grey.shade50,
                        textStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)
                      );
                    },
                    child: Container(
                      height: 60.0,
                      width: 220.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Theme.of(context).primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 20.0,
                            )
                          ]),
                      child: Center(
                        child: Text(
                         bought == false ? 'Buy Now': "Thanks",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print(pressed);

                        if (pressed == true) {
                          setState(() {
                            pressed = false;
                          });
                        } else{
                          setState(() {
                            pressed = true;
                          });
                        }
                    },
                    child: Container(
                      height: 60.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: pressed == false ? Colors.black:Colors.red,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 20.0,
                            )
                          ]),
                      child: Center(
                          child: Icon(
                            pressed == false? Icons.favorite_border :Icons.favorite,
                            color: Colors.white,
                            size: 30.0,
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
