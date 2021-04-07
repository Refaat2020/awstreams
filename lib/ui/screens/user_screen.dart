import 'package:awstreams/cubit/user_cubit.dart';
import 'package:awstreams/model/user_model.dart';
import 'package:awstreams/ui/widgets/error_widget.dart';
import 'package:awstreams/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (UserFetched().userData != null) {
      print("mliana");
    }
    final fetch = context.read<UserCubit>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<UserCubit,UserState>(
          builder: (context, state) {
            if (state is UserLoading) {

              return LoadingWidget();
            } else if (state is UserFetched && state.userData != null) {
              return ListView(
                children: <Widget>[
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.deepOrange.shade300],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.5, 0.9],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ///for image
                        CircleAvatar(
                          backgroundColor: Colors.white70,
                          minRadius: 70.0,
                          child: CircleAvatar(
                            radius: 65.0,
                            backgroundImage: NetworkImage(
                                '${state.userData.pictures.extraLarge.toString().trim()}'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        ///for name
                        Text(
                      state.userData.name  ,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        ///for postion
                        Expanded(
                          flex: 1,
                          child: Text(
                            state.userData.biog,
                            textAlign: TextAlign.center,
                            style: TextStyle(

                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///for following and followers
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.deepOrange.shade300,
                            child: ListTile(
                              title: Text(
                                state.userData.followerCount.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),

                              ///followers
                              subtitle: Text(
                                'Followers',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ),
                        ),

                        ///followers

                        Expanded(
                          child: Container(
                            color: Colors.red,
                            child: ListTile(
                              title: Text(
                                state.userData.followingCount.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                'Following',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'City',
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            state.userData.city,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          title: Text(
                            'country',
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            state.userData.country,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            return ErrorWidgetq(message: "Error",);
          },
          listener: (context, state) {
            if (state is UserField) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('${state.error}')));
            }
          },
        ),
    );
  }
}
