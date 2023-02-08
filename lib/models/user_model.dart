// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.id,
        required this.username,
        required this.email,
        required this.profilePicture,
        required this.coverPicture,
        required this.following,
        required this.followers,
        required this.isAdmin,
        required this.desc,
        required this.v,
    });

    String id;
    String username;
    String email;
    String profilePicture;
    String coverPicture;
    List<dynamic> following;
    List<dynamic> followers;
    bool isAdmin;
    String desc;
    int v;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        profilePicture: json["profilePicture"],
        coverPicture: json["coverPicture"],
        following: List<dynamic>.from(json["following"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        isAdmin: json["isAdmin"],
        desc: json["desc"],
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
        "__v": v,
    };
}
