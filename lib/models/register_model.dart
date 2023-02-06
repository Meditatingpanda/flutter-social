// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    RegisterModel({
        required this.user,
    });

    User user;

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
    };
}

class User {
    User({
        required this.username,
        required this.email,
        required this.password,
        required this.profilePicture,
        required this.coverPicture,
        required this.following,
        required this.followers,
        required this.isAdmin,
        required this.desc,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String username;
    String email;
    String password;
    String profilePicture;
    String coverPicture;
    List<String> following;
    List<dynamic> followers;
    bool isAdmin;
    String desc;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        profilePicture: json["profilePicture"],
        coverPicture: json["coverPicture"],
        following: List<String>.from(json["following"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        isAdmin: json["isAdmin"],
        desc: json["desc"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "profilePicture": profilePicture,
        "coverPicture": coverPicture,
        "following": List<dynamic>.from(following.map((x) => x)),
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "isAdmin": isAdmin,
        "desc": desc,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
