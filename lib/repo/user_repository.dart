import 'dart:io';

import 'package:awstreams/model/user_model.dart';
import 'package:awstreams/services/http_services.dart';

class UserRepository{
  Future<UserModel> getUser()async{
    try {
      final response = await HttpServices.getRequest();

      if(response.statusCode == 200){
        print(response.body);

        final result = userModelFromJson(response.body);
        return result;
      }else{
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}