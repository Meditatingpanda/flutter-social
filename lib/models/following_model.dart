// To parse this JSON data, do
//
//     final followingModel = followingModelFromJson(jsonString);

import 'dart:convert';

List<FollowingModel> followingModelFromJson(String str) => List<FollowingModel>.from(json.decode(str).map((x) => FollowingModel.fromJson(x)));

String followingModelToJson(List<FollowingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FollowingModel {
    FollowingModel({
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

    factory FollowingModel.fromJson(Map<String, dynamic> json) => FollowingModel(
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
