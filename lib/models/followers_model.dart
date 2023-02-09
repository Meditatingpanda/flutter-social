// To parse this JSON data, do
//
//     final followersModel = followersModelFromJson(jsonString);

import 'dart:convert';

List<FollowersModel> followersModelFromJson(String str) => List<FollowersModel>.from(json.decode(str).map((x) => FollowersModel.fromJson(x)));

String followersModelToJson(List<FollowersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FollowersModel {
    FollowersModel({
        required this.id,
        required this.username,
        required this.profilePicture,
        required this.email,
        required this.desc,
        required this.coverPicture,
        required this.following,
        required this.followers,
    });

    String id;
    String username;
    String profilePicture;
    String email;
    String desc;
    String coverPicture;
    List<String> following;
    List<String> followers;

    factory FollowersModel.fromJson(Map<String, dynamic> json) => FollowersModel(
        id: json["_id"],
        username: json["username"],
        profilePicture: json["profilePicture"],
        email: json["email"],
        desc: json["desc"],
        coverPicture: json["coverPicture"],
        following: List<String>.from(json["following"].map((x) => x)),
        followers: List<String>.from(json["followers"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "profilePicture": profilePicture,
        "email": email,
        "desc": desc,
        "coverPicture": coverPicture,
        "following": List<dynamic>.from(following.map((x) => x)),
        "followers": List<dynamic>.from(followers.map((x) => x)),
    };
}
