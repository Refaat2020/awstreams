// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.key,
    this.url,
    this.name,
    this.username,
    this.pictures,
    this.biog,
    this.createdTime,
    this.updatedTime,
    this.followerCount,
    this.followingCount,
    this.cloudcastCount,
    this.favoriteCount,
    this.listenCount,
    this.isPro,
    this.isPremium,
    this.city,
    this.country,
    this.coverPictures,
    this.picturePrimaryColor,
  });

  String key;
  String url;
  String name;
  String username;
  Pictures pictures;
  String biog;
  DateTime createdTime;
  DateTime updatedTime;
  int followerCount;
  int followingCount;
  int cloudcastCount;
  int favoriteCount;
  int listenCount;
  bool isPro;
  bool isPremium;
  String city;
  String country;
  CoverPictures coverPictures;
  String picturePrimaryColor;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    key: json["key"],
    url: json["url"],
    name: json["name"],
    username: json["username"],
    pictures: Pictures.fromJson(json["pictures"]),
    biog: json["biog"],
    createdTime: DateTime.parse(json["created_time"]),
    updatedTime: DateTime.parse(json["updated_time"]),
    followerCount: json["follower_count"],
    followingCount: json["following_count"],
    cloudcastCount: json["cloudcast_count"],
    favoriteCount: json["favorite_count"],
    listenCount: json["listen_count"],
    isPro: json["is_pro"],
    isPremium: json["is_premium"],
    city: json["city"],
    country: json["country"],
    coverPictures: CoverPictures.fromJson(json["cover_pictures"]),
    picturePrimaryColor: json["picture_primary_color"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "url": url,
    "name": name,
    "username": username,
    "pictures": pictures.toJson(),
    "biog": biog,
    "created_time": createdTime.toIso8601String(),
    "updated_time": updatedTime.toIso8601String(),
    "follower_count": followerCount,
    "following_count": followingCount,
    "cloudcast_count": cloudcastCount,
    "favorite_count": favoriteCount,
    "listen_count": listenCount,
    "is_pro": isPro,
    "is_premium": isPremium,
    "city": city,
    "country": country,
    "cover_pictures": coverPictures.toJson(),
    "picture_primary_color": picturePrimaryColor,
  };
}

class CoverPictures {
  CoverPictures({
    this.the835Wx120H,
    this.the1113Wx160H,
    this.the1670Wx240H,
  });

  String the835Wx120H;
  String the1113Wx160H;
  String the1670Wx240H;

  factory CoverPictures.fromJson(Map<String, dynamic> json) => CoverPictures(
    the835Wx120H: json["835wx120h"],
    the1113Wx160H: json["1113wx160h"],
    the1670Wx240H: json["1670wx240h"],
  );

  Map<String, dynamic> toJson() => {
    "835wx120h": the835Wx120H,
    "1113wx160h": the1113Wx160H,
    "1670wx240h": the1670Wx240H,
  };
}

class Pictures {
  Pictures({
    this.small,
    this.thumbnail,
    this.mediumMobile,
    this.medium,
    this.large,
    this.the320Wx320H,
    this.extraLarge,
    this.the640Wx640H,
  });

  String small;
  String thumbnail;
  String mediumMobile;
  String medium;
  String large;
  String the320Wx320H;
  String extraLarge;
  String the640Wx640H;

  factory Pictures.fromJson(Map<String, dynamic> json) => Pictures(
    small: json["small"],
    thumbnail: json["thumbnail"],
    mediumMobile: json["medium_mobile"],
    medium: json["medium"],
    large: json["large"],
    the320Wx320H: json["320wx320h"],
    extraLarge: json["extra_large"],
    the640Wx640H: json["640wx640h"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "thumbnail": thumbnail,
    "medium_mobile": mediumMobile,
    "medium": medium,
    "large": large,
    "320wx320h": the320Wx320H,
    "extra_large": extraLarge,
    "640wx640h": the640Wx640H,
  };
}
