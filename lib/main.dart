import 'package:awstreams/cubit/cart_cubit.dart';
import 'package:awstreams/cubit/user_cubit.dart';
import 'package:awstreams/repo/user_repository.dart';
import 'package:awstreams/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(UserRepository()),),
        BlocProvider(create: (context) => CartCubit(),),

      ],
      child: MaterialApp(
          title: 'Awstrems',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.black,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
        ),
    );
  }
}

