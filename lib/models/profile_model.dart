// To parse this JSON data, do
//
//     final profileUserModel = profileUserModelFromJson(jsonString);

import 'dart:convert';

List<ProfileUserModel> profileUserModelFromJson(String str) => List<ProfileUserModel>.from(json.decode(str).map((x) => ProfileUserModel.fromJson(x)));

String profileUserModelToJson(List<ProfileUserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileUserModel {
    ProfileUserModel({
        required this.id,
        required this.userId,
        required this.desc,
        required this.img,
        required this.likes,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String id;
    final String userId;
    final String desc;
    final String img;
    final List<String> likes;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    factory ProfileUserModel.fromJson(Map<String, dynamic> json) => ProfileUserModel(
        id: json["_id"],
        userId: json["userId"],
        desc: json["desc"],
        img: json["img"],
        likes: List<String>.from(json["likes"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "desc": desc,
        "img": img,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
