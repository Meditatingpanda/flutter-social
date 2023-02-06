// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'dart:convert';

List<PostsModel> postsModelFromJson(String str) => List<PostsModel>.from(json.decode(str).map((x) => PostsModel.fromJson(x)));

String postsModelToJson(List<PostsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsModel {
    PostsModel({
        required this.id,
        required this.userId,
        required this.desc,
        required this.img,
        required this.likes,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String id;
    String userId;
    String desc;
    String img;
    List<dynamic> likes;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        id: json["_id"],
        userId: json["userId"],
        desc: json["desc"],
        img: json["img"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
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
