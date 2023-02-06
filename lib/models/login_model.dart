// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.id,
        required this.username,
        required this.email,
        required this.profilePicture,
        required this.coverPicture,
        required this.following,
        required this.followers,
        required this.isAdmin,
        required this.desc,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String id;
    String username;
    String email;
    String profilePicture;
    String coverPicture;
    List<String> following;
    List<dynamic> followers;
    bool isAdmin;
    String desc;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        profilePicture: json["profilePicture"],
        coverPicture: json["coverPicture"],
        following: List<String>.from(json["following"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        isAdmin: json["isAdmin"],
        desc: json["desc"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "profilePicture": profilePicture,
        "coverPicture": coverPicture,
        "following": List<dynamic>.from(following.map((x) => x)),
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "isAdmin": isAdmin,
        "desc": desc,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
